---
title: Where are my keys?
date: 2024-06-17T15:00:00-06:00
categories:
  - Matrix
tags:
  - Cryptography
  - E2EE
description: |
  Matrix has a lot of keys. There are keys for devices, keys for users, keys for
  messages, keys for backups, keys for the keys to the backups, etc. All of
  these keys provide different functionality. There are a lot of resources
  explaining message keys (with the olm/megolm protocol), but not as many
  explaining the rest of the keys in the Matrix protocol. This talk intends to
  be an overview of those keys which provide infrastructure for key backups, key
  sharing, device verification, and cross-signing.

  This talk is designed for people with a basic understanding of the various
  Matrix features. You do not need to know anything about cryptography to gain
  value from this talk. I will cover some basics of cryptosystems, but at a very
  high level cursory level in order to motivate the selection of key algorithms.
draft: true
---

TODO: clean this up for being more of a blog post than a talk.

Hello, my name is Sumner, I'm a software engineer at Automattic working on
Beeper and today I'm going to be talking about cryptographic key infrastructure
in Matrix.

End-to-end encryption is one of the things which brought me to Matrix, and I'm
sure that it's one of the factors that brought many of you to Matrix as well.

However, Matrix's user experience with cryptography is often confusing. I mainly
blame the other chat networks for their incompetence. Most other chat networks
don't even provide any cryptographically-guaranteed security and privacy. Some
networks provide encryption in a way that does not truly leave the user in
control of their keys. Only a few networks (Signal) truly leave the user in
control, and their UX is arguably worse than Matrix.

In this talk, my goal is to discuss the cryptographic key _infrastructure_ in
Matrix. What do I mean by "infrastructure"? I mean all of the features which
support key sharing and identity verification, but don't actually themselves
provide security. You can think of this talk as discussing the "UX layer of
cryptography in Matrix". None of the things that I'm going to discuss are
strictly necessary for ensuring secure E2EE communication, but without them,
Matrix' UX would be horrible.

This is a diagram of the things we are going to talk about today. This diagram
represents all of the infrastructure in Matrix for sharing, backing up, and
verifying keys.

TODO show diagram(s?) of what I'm going to explain.

Don't worry, we are going to go step-by-step through this, at the end of the
talk you should have an understanding of what this diagram means.

- megolm
- key exchange
- key backup
- master key
- verification
- cross-signing

Let's start by discussing the goals of using cryptography for messaging.

There are two main features people want from encryption:

1. **Message Privacy:** only the people who are part of the conversation should
   be allowed to view the messages of the conversation. As a corollary to this,
   we want to ensure that messages cannot be tampered with by a
   man-in-the-middle actor without the receiving party knowing.
1. **Identity Verification:** verifying that sender of a message is actually who
   they say they are. We want cryptographically guarantee that a bad actor is
   not impersonating the sender. Note that one of the most important parts of
   identity this is verifying that our own devices are under our own control and
   we should allow our own clients to share keys to it.

Let's look back at the diagram to see which pieces of the diagram are necessary
for each of these aspects.

TODO diagrams

We will look at each in turn, but first, we need to take a short detour into
cryptosystems. We aren't going to go too deep, just enough to understand the
cryptographic primitives we have at our disposal.

## Cryptosystems

## Message Privacy

- megolm
- key requests
- key backup
- SSSS
- m.secret.request

## Identity Verification

- cross-signing
- SSSS (again)

---

In this talk, I want to demystify cryptography in Matrix and provide you with a
framework for understanding what all of the keys are for.

Beeper is an app that allows users to connect all of their chat networks to a
single app. You can have all of your chats from Meta (Facebook and Instagram),
WhatsApp, Signal, and many other networks all in the same app.

Beeper is built on top of the Matrix protocol, and all Beeper accounts are
Matrix accounts on the beeper.com homeserver. We are building towards a world in
which everyone just talks over the Matrix network to one another, rather than
having to use bridges, but until that day comes, we use bridges as a way to
allow people to come into the ecosystem without having to sacrifice talking to
specific friends just because they haven't yet come over to Beeper or another
Matrix homeserver.

I work on the Platform team at Beeper. Our team does three main things:

1. **We maintain backend services and infrastructure.** I gave a talk at the
   2022 Berlin Matrix Summit about our bridge architecture, focusing around
   hungryserv which is the custom homeserver implementation designed for
   handling unfederated bridge traffic.

   We also maintain all of the kubernetes infrastructure, user management
   services, a Synapse instance, and many other backend services.
2. **We maintain all of the mautrix bridges.** I have worked extensively on the
   LinkedIn, iMessage, Signal, WhatsApp, and most recently the new Telegram
   bridge written in Go.
3. **We maintain a Go client SDK** that our next-generation clients like the new
   Android app use.

I've had the opportunity to work on all of these things. However, in Q2 of this
year after we got acquired by Automattic, building the Go SDK has taken up a
significant portion of our bandwidth. I ended up implementing a ton of
cryptography-related features.

- I implemented key backup (and corrupted multiple key backups in the process).
- I built the interactive QR code verification framework (and generated many a
  bad QR code in the process).
- And most recently, I've been experimenting with a pure-Go implementation of
  the Olm/Megolm protocols originally written by @DerLukas as a way to replace
  libolm in our clients.

As I implemented these features, I learned a lot about cryptography in Matrix,
which leads me to the topic of this talk: **cryptographic key infrastructure in
Matrix.**

If you've used Matrix for any period of time, you will know that Matrix has a
lot of keys. There are keys for devices, keys for users, keys for messages, keys
for the keys for messages, keys for backups, keys for the keys to the backups.
In this talk, I'm going to try to provide a framework for thinking about keys in
Matrix. I also will discuss some of the quirks and pitfalls that are either
baked into the spec and which are a function of the nature of a networked
protocol.

I want to demystify why you might see a red shield, or why you might encounter a
message that you can't decrypt. I'm going to touch on the technical details of
the encryption primitives that Matrix uses, but I am by no means an expert in
cryptography. I took a single cryptography class, and I attended lecture maybe
twice, so I'll limit myself to the bare minimum discussion of encryption
primitives so as not to embarrass myself.

My goal is also to highlight _what_ each of the keys does and which users
experiences each key enables for the users.

## Reasons for Cryptography

At its core, there are two pairs of primitive operations that cryptosystems[^1]
provide to us which are interesting:

- Encryption and Decryption
- Signing and Signature Verification

[^1]: A cryptosystem is a suite of cryptographic algorithms that work together
to provide a set of security features.

With these two primitive operations, we can build a private, verifiable
messaging system.

Matrix uses cryptography for two main purposes:

1. **Privacy:** only the people who are part of the conversation should be
   allowed to view the messages of the conversation. As an additional benefit of
   how Matrix achieves this, encrypted messages cannot be tampered with by a
   man-in-the-middle actor without the receiving party knowing.
1. **Identity:** verifying that a user or device is who they say they are. Note
   that one of the most important parts of identity this is verifying that our
   own devices are under our own control and we should allow our own clients to
   share keys to it.

Note that I'm focused here on the client view of cryptography. There are also
keys involved with the server-to-server federation API, but I haven't studied
that at all. From what I understand, it's significantly more straightforward and
is only concerned with identity, as homeservers are not considered to be trusted
actors in the Matrix security model.

We are going to investigate the world of Matrix cryptography from these two
perspectives. It's not a clean split, because identity and privacy are
intertwined within the encryption protocols, but I think it's useful to consider
them separately for simplicity, and I'll point out where they intersect.

As we look at each side, we will build up from the primitives. But first, we
have to talk about the primitives that we have at our disposal by taking a short
journey into the depths of cryptosystems.

## Cryptosystems

There are a few core concepts that you need to be aware of.

### Encryption: Symmetric vs Asymmetric

There are two main categories of encryption schemes: symmetric and asymmetric.

In a symmetric encryption scheme, both the encryptor and the decryptor share the
same key, and that key is used in both the encryption and decryption of the
message.

In an asymmetric encryption scheme, the encryptor needs the public key, and the
decryptor needs the private key. The encryptor encrypts the message with the
public key, and the private key is required to decrypt the message.

|              | Symmetric | Asymmetric  |
| ------------ | --------- | ----------- |
| Encrypt With | Key       | Public Key  |
| Decrypt With | Key       | Private Key |

You can spread around the public key to lots of parties, and then they can send
encrypted messages to you, but you are the only one who can decrypt any messages
encrypted to you. Critically, an attacker having your public key does not allow
them to decrypt your messages.

Asymmetric encryption already seems better, but there's a couple catches:

1. **It's slow!** Many systems end up using asymmetric encryption to exchange
   and agree upon a symmetric key, and then use the symmetric key for
   communication.
2. **Current well-established asymmetric cryptosystems are not
   quantum-resistant.** Many symmetric encryption schemes (AES-256 for example)
   are considered to be quantum-resistant.

### RSA vs Elliptic Curves

In order for public-key cryptography, you need a function which takes data and
mangles it in such a way that retrieving the initial data is (a) very very
difficult to do by brute-force-searching the range of possible values and (b)
easy to do if you know which of the values within the range was used.

There are two types of classical public key cryptosystems which each derive
their difficulty from different problems:

- **RSA (Rivest–Shamir–Adleman)** systems base their complexity on the
  difficulty of factoring prime numbers.
- **Elliptic Curve** systems are based on the assumption that "finding the
  discrete logarithm of a random elliptic curve element with respect to a
  publicly known base point is infeasible" [^2].

  Understanding elliptic-curve cryptography requires deep knowledge of abstract
  algebra which I am totally unqualified to discuss. Practically, all you need
  to know is that there's some squiggly curves which have special properties
  which make things difficult to compute backwards without knowing an additional
  reference point.

[^2]: https://en.wikipedia.org/wiki/Elliptic-curve_cryptography#Application_to_cryptography

### Diffie-Hellman key exchanges

TODO

### Hashes

### Expanding a small key into a large one

Sometimes, we need to turn a small secret (say one agreed upon via a
Diffie-Hellman exchange) into a larger amount of bytes (for example, to perform
an AES-256 symmetric encryption).

For this, we have HKDF which is a key derivation function (KDF)

- HKDF

- HMAC

## Privacy

In order to guarantee message privacy, we want the following properties:

- key for every message
- TODO (basically everything in the double ratchet)

Fundamentally, messages need to be encrypted with a key that both parties share
and agree upon.

The simplest thing that work provide sufficient security would be to require
users to do the following on each message send:

1. Generate a random AES key
2. Meet in person with every person in the chat and type the key into the other
   person's device before sending every message. Obviously this is not a good
   experience for anybody, so we have to devise a way to share the key that
   doesn't involve meeting before every message and typing AES keys.

We want something that allows us to (a) securely share the key and (b) rotate
the key automatically after each message.

### Securely Sharing Keys

Luckily, we already know about established methods for exchanging keys across an
insecure channel: Diffie-Hellman!

But for Diffie-Hellman, we need a key on both sides to do the ECDH against.

TODO one time keys

### Rotating Keys

HKDF

### N^2 problem: we need to share the key to every user in the chat.

Solution: Megolm

### Pitfall: what if they key send fails or we don't have it for some reason?

- could happen due to:
  - logging into a new device
  - bug
- key requests!
  - clients can request keys from other devices

### Key chatter requires the device to be online

- key backup

* 2 fundamental types of keys:
  - message keys - encrypt the content of the message
  - identity keys - cryptographically verify that the message was sent by the
    person who claims to have sent it

* 3 ways to get message keys
  - via sharing megolm keys via olm sessions
  - via key chatter between own devices
  - via key backup

  - q: how to know whether we should send a key to another device?
    - verification

* identity keys - device authenticity
  - device signing keys
  - cross-signing keys
