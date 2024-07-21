---
title: Message Security in Matrix
date: 2024-07-21T05:00:00-06:00
categories:
  - Matrix
tags:
  - Cryptography
  - E2EE
  - Megolm
description: |
  In Matrix, message security is provided by the megolm protocol. In this
  article, I'm going to describe the megolm protocol, and explain what security
  guarantees it provides and how it provides them.
draft: true
---

In Matrix, message security is provided by the Megolm protocol. In this article,
I'm going to describe the Megolm protocol, and explain what security guarantees
it provides and how it provides them.

I'm going to be focusing on Megolm itself, rather than on Olm as there are
already many resources for learning about Olm (the Signal Double-Ratchet
Algorithm).

## What's the Goal?

One of the primary goals of the Matrix protocol is to provide a user-friendly
end-to-end-encrypted messaging system. End-to-end encryption requires that
messages be encrypted on the sender device, and can only be decrypted on devices
of users who are a part of the conversation. We want to prevent other parties
(rouge homeservers, man-in-the-middle attackers, etc.) from decrypting the
messages.

{{% note title="Cryptography Prerequisites" %}}

In this sidebar, I'm going to be discussing the prerequisite knowledge required
for understanding the rest of the article. If you are already familiar with all
of the terms below, you are free to skip this section. You can always come back
to it if you don't understand something!

<details>
<summary><b>Encryption: Symmetric vs Asymmetric</b></summary>

There are two main categories of encryption schemes: **symmetric** and **asymmetric**.

In a symmetric encryption scheme, both the encryptor and the decryptor share the
same key, and that key is used in both the encryption and decryption of the
message.

In an asymmetric encryption scheme, the encryptor needs the public key, and the
decryptor needs the private key. The encryptor encrypts the message with the
public key, and the private key is required to decrypt the message.

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

At its core, a public-key cryptosystem needs a one-way function which takes data
and mutates it in such a way that retrieving the initial data is (a) extremely
difficult to do by brute-force-searching the range of possible values and (b)
easy to do if you know an additional piece of information about the mutation.

There are two types of classical public key cryptosystems which each derive
their difficulty from different problems:

- **RSA (Rivest–Shamir–Adleman)** systems base their complexity on the
  difficulty of factoring prime numbers.
- **Elliptic Curve** systems are based on the assumption that "finding the
  discrete logarithm of a random elliptic curve element with respect to a
  publicly known base point is infeasible" [^1].

  Understanding elliptic-curve cryptography requires deep knowledge of abstract
  algebra which I am totally unqualified to discuss. Practically, all you need
  to know is that there's some squiggly curves which have special properties
  which make things difficult to compute backwards without knowing an additional
  reference point.



[^1]: https://en.wikipedia.org/wiki/Elliptic-curve_cryptography#Application_to_cryptography

</details>

{{% /note %}}
