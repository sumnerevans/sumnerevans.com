---
title: Matrix Cryptographic Key Infrastructure
date: 2024-09-05T15:00:00-06:00
categories:
  - Matrix
tags:
  - Cryptography
  - E2EE
description: |
  In this article, my goal is to discuss the cryptographic key _infrastructure_
  in Matrix. What do I mean by "infrastructure"? I mean all of the features
  which support key sharing and identity verification, but don't actually
  themselves provide security. You can think of this article as discussing the
  "UX layer of cryptography in Matrix". None of the things that I'm going to
  discuss are strictly necessary for ensuring secure E2EE communication, but
  without them, Matrix' UX would be horrible.
summary: |
  End-to-end encryption is one of the things which brought me to Matrix, and I'm
  sure that it's one of the factors that brought many of you to Matrix as well.

  However, Matrix's user experience with cryptography is often confusing. I
  mainly blame the other chat networks for their incompetence. Most other chat
  networks don't even provide any cryptographically-guaranteed security and
  privacy. Some networks provide encryption in a way that does not truly leave
  the user in control of their keys. Only a few networks (Signal) truly leave
  the user in control, and their UX is arguably worse than Matrix.
image: ./images/overview.png
draft: true
---

{{% note title="Slides" %}}

This is a companion article to the
[talk by the same name](https://cfp.matrix.org/matrixconf2024/talk/TD3KDQ/) that
I gave at the 2024 Matrix Conference.

<a href="slides.pdf" target="_blank"><i class="fa fa-file-pdf-o"></i> Slides</a>
|
<a href="slides-with-notes.pdf" target="_blank"><i class="fa fa-file-pdf-o"></i>
Slides + Notes</a>

{{% /note %}}

End-to-end encryption is one of the things which brought me to Matrix, and I'm
sure that it's one of the factors that brought many of you to Matrix as well.

However, Matrix's user experience with cryptography is often confusing. I mainly
blame the other chat networks for their incompetence. Most other chat networks
don't even provide any cryptographically-guaranteed security and privacy. Some
networks provide encryption in a way that does not truly leave the user in
control of their keys. Only a few networks (Signal) truly leave the user in
control, and their UX is arguably worse than Matrix.

In this article, my goal is to discuss the cryptographic key _infrastructure_ in
Matrix. What do I mean by "infrastructure"? I mean all of the features which
support key sharing and identity verification, but don't actually themselves
provide security. You can think of this article as discussing the "UX layer of
cryptography in Matrix". None of the things that I'm going to discuss are
strictly necessary for ensuring secure E2EE communication, but without them,
Matrix' UX would be horrible.

Matrix uses cryptography for two main purposes:

- **Message Security** --- only the people who are part of the conversation
  should be allowed to view messages of the conversation.[^1]
- **Identity** --- verifying that a user or device is who they say they are.[^2]

We will look at how it accomplishes both of these goals and the infrastructure
required to move the necessary keys around.

[^1]: As an additional benefit of how Matrix achieves this, encrypted messages
    cannot be tampered with by a man-in-the-middle actor without the receiving
    party knowing.

[^2]: Note that one of the most important parts of identity this is verifying
    that our own devices are under our own control and we should allow our own
    clients to share keys to it.

## Big Picture

In this article, we will be exploring the following diagram. It represents all
of the infrastructure in Matrix for providing those core features of message
security and identity verification.

![](./images/overview.png)

I know, it's pretty overwhelming. But don't worry, we are going to go
step-by-step through this, at the end of the article you should have an
understanding of what each part of this diagram means.

Let's start by orienting ourselves to the big picture of this diagram, then we
will break down the diagram into manageable pieces. And at the end of the talk
hopefully you have a complete understanding of Matrix cryptographic key
infrastructure.

You can see that there are two users represented in the diagram: Bob on the top
and Alice on the bottom. The diagram is focused on how the Megolm session
created by Alice's Device 1 is shared to Bob and to Alice's Device 2.

Additionally, the diagram is color-coded.

- Red nodes represent data that does not leave the device.
- Green nodes represent data is public and can be shared with the server and
  other users.
- Orange nodes represent data that can be shared with trusted parties, or with
  members of the same Matrix room.
- Blue and purple nodes represent cryptographic operations.

### Message Security

It's important that we don't loose sight of the reason for all of this
infrastructure. In orange within each of the devices, we have the core of Matrix
security: the Megolm session.

![](./images/message-security.png)

For the purposes of this article, the only thing you need to know about the
Megolm session is that it provides end-to-end encryption for messages and needs
to be shared with all devices that Alice wants to be able to read her messages.
I wrote a full [article about Megolm]({{<ref"../megolm/index.md">}}) if you want
to learn more.

The Megolm session needs to be shared to the devices of other users in the same
Matrix room (in this case Bob) as well as Alice's other devices.

### Identity

Next let's discuss identity. The highlighted parts of the diagram provide a
cryptographic way to verify that a device belongs to a particular user.

![](./images/identity-overview.png)

There are actually two pieces here: determining trust for our own user and
determining trust for other users. We will look at each of these in more depth
later.

### The Other Stuff

So what is all of the other stuff? That is the **infrastructure** for sharing
the Megolm session around to other devices and users. There are arrows
representing Olm-encrypted to-device messages going between devices. The
lower-right section of the diagram represents key backup which allows you to
backup your keys to the server and restore from your other devices. Then, on the
bottom-left we have the infrastructure necessary for storing secrets on the
server encrypted by a recovery code.

{{% note title="Cryptography Prerequisites" %}}

This article requires some basic understanding of the following cryptography
concepts:

- Encryption (symmetric and asymmetric)
- Asymmetric signatures
- Hashes and HMAC
- Key-Derivation Functions (HKDF)
- Diffie-Hellman Key Exchanges

If you are unfamiliar with any of these topics, check out the
[Matrix Cryptography Prerequisites]({{<relref"../cryptography-prerequisites/index.md">}})
companion article which describes the prerequisites in enough detail to
understand the rest of this article.

{{% /note %}}

## Sharing Keys

We're going to start by discussing how we get keys from one device to another.
This process is generally called "key sharing".

Remember, what the key that we want to share is the Megolm key. That's what
encrypts the messages. There are two ways to share these: encrypted olm events
and key backup.

### Encrypted Olm Events

In the following diagram, I got rid of everything besides the Megolm session and
the encrypted Olm events which are highlighted in red. The events are sent as
to-device messages which allow you to send messages to specific devices (rather
than to rooms).

![](./images/to-device-zoomed.png)

I'm not going to discuss how Olm encryption works. It's already been covered
many times since it's basically just the
[Signal double-ratchet algorithm](https://en.wikipedia.org/wiki/Double_Ratchet_Algorithm).
For our purposes, it's sufficient to know that we can send keys securely to
other users' devices via these `m.room_key` events and our own devices using via
to-device events via Olm. We can also request keys by sending
`m.room_key_request` events to our own **verified** devices and the other
devices can respond using `m.forwarded_room_key` events. We will talk about how
we know a device is verified later.

This seems great, why do we have anything else? Well, new logins are the issue.
Say Alice just logged in on Device 2 and finished verification.

- If Device 1 is _online_, she can send key requests, but there's likely going
  to be a ton of requests due to all of the keys in all of the rooms to her
  Device 1. This will make Device 1 do a lot of work sending back all the keys.
- If Device 1 is _offline_, her send key requests won't be answered.

That's where **key backup** comes into play. Key backup allows us to store keys
on the server, and restore them from our other devices without the other devices
needing to be online.

### Key Backup

In the following diagram, I got rid of everything not related to key backup.

![](./images/key-backup-zoomed.png)

In the middle here we have this green "key backup" thing which is stored on the
server. We're trying to get the Megolm key from Alice's Device 1 to her Device
2, so left to right.

There are two pieces to key backup: _the version_ which includes a public key
for the backup and _the encrypted session data_ (there are many of these in a
backup (one per megolm session stored)).

The first thing to note is that AES is used on both sides to do the encryption
and decryption of the Megolm session, so only the encrypted version is stored on
the server. But, where do we get the key and IV from? Well, we get it from HKDF.
So, the next question is where do we get the key for HKDF? That comes from a
call to ECDH. Note that all this up to ECDH is **the same on both the encrypting
and decrypting sides!**

Remember, ECDH requires a public key and a private key. Either private key,
combined with the other public key will result in the same value from ECDH.

\[\textbf{ECDH}(A_{private}, B_{public}) = \textbf{ECDH}(B_{private},
A_{public}) = K_{shared} \]

So, what keypairs are we going to use?

- The first keypair is the Megolm backup keypair. The public key is stored in
  the key backup version on the server. The private key is a secret known by the
  user.
- The second keypair is the Epemeral keypair. It gets created for each encrypted
  session data. It's ephemeral because the private part can be discarded
  immediately after the encryption is done. The public key is stored in the
  encrypted session data.

This is where the sides diverge.

- The encrypting side gets its private key from this _ephemeral keypair_. Thus,
  it uses the Megolm backup public key as its public key.
- The decrypting side gets its private key from the Megolm backup private key.
  Thus, it uses the ephemeral public key as its public key.

**Critically** you must have the Megolm backup private key to decrypt the key
backup. We will discuss how that is stored later.

For each Megolm session that we back up in key backup, we store the ephemeral
public key and the ciphertext from AES together in the encrypted session data
object. But there's another item that we store in this object: the MAC.

MACs are meant to ensure that the ciphertext hasn't been tampered with by a
malicious or incompetent party. We use HMAC to avoid rainbow table attacks, and
we get the HMAC key from the same HKDF as the AES key and IV. The other input to
HMAC _should_ have been the ciphertext. However, the original implementation in
libolm failed to do this correctly and instead just passed an empty buffer, and
it has been de-facto spec ever since.[^3]

[^3]: I documented this behaviour in
    [matrix-org/matrix-spec#1712](https://github.com/matrix-org/matrix-spec/pull/1712).

So, the MAC is not really useful at all in its current state. I'm hoping that a
future version of the spec fixes this. Maybe when we get signed backups we will
get that.
