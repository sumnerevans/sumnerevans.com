---
title: Matrix Cryptography Prerequisites
date: 2024-08-09T05:00:00-06:00
categories:
  - Matrix
  - Programming
tags:
  - Cryptography
  - E2EE
  - Encryption
  - Symmetric Encryption
  - Asymmetric Encryption
  - RSA
  - Elliptic Curve Cryptography
  - Diffie-Hellman
  - Hashes
  - HMAC
  - HKDF
description: |
  Understanding Matrix cryptography necessitates understanding of some basic
  cryptography primitives. This article intends to explain those prerequisites
  in simple terms.
math: true
---

Understanding Matrix cryptography requires understanding some basic cryptography
primitives. This article intends to explain those prerequisites in simple terms.
This article is _not_ a rigorous, mathematical description of the cryptosystems
in use. Rather, it is a practical guide to what _functionality_ each of the
cryptography primitives provides. I've tried to include links to external
resources if you are interested in learning more about a specific topic.

## Encryption: Symmetric vs Asymmetric

There are two main categories of encryption schemes:
[**symmetric**](https://en.wikipedia.org/wiki/Symmetric-key_algorithm) and
[**asymmetric**](https://en.wikipedia.org/wiki/Public-key_cryptography).

In a _symmetric_ encryption scheme, both **the encryptor and the decryptor share
the same key** and that key is used in both the encryption and decryption of the
message.

The main symmetric encryption scheme that Matrix uses is **AES-256-CBC**. AES
stands for Advanced Encryption Standard, and the 256 part indicates the number
of bits required for each key. CBC is the encryption mode (the details are not
relevant, but included here for completeness). AES-256-CBC takes two inputs: the
32-byte (256-bit) key and a 16-byte (128-bit) initialization vector (IV).

In an _asymmetric_ encryption scheme, **the encryptor needs the public key, and
the decryptor needs the private key**. The encryptor encrypts the message with
the public key, and the private key is required to decrypt the message.

You can spread around the public key to lots of parties, and then they can send
encrypted messages to you, but you are the only one who can decrypt any messages
encrypted to you. Critically, an attacker having your public key does not allow
them to decrypt your messages.

Asymmetric encryption already seems better, but there's a couple catches:

1. **It's slow!** Many systems end up using asymmetric encryption to exchange
   and agree upon a symmetric key, and then use the symmetric key for
   communication.
2. **Classical asymmetric cryptosystems are not quantum-resistant.** All modes
   of AES-256, on the other hand, are considered to be quantum-resistant. There
   are some new NIST-standardised quantum-resistant asymmetric cryptosystems,
   but support for such systems is not as widespread as the classical
   non-quantum-resistant asymmetric cryptosystems.

At its core, a public-key cryptosystem needs a one-way function which takes data
and mutates it in such a way that retrieving the initial data is (a) extremely
difficult to do by brute-force-searching the range of possible values and (b)
easy to do if you know an additional piece of information about the mutation.

There are two types of classical public key cryptosystems which each derive
their difficulty from different problems:

- [**RSA (Rivest–Shamir–Adleman)**](https://en.wikipedia.org/wiki/RSA_(cryptosystem))
  systems base their complexity on the difficulty of factoring prime numbers.
- [**Elliptic Curve**](https://en.wikipedia.org/wiki/Elliptic-curve_cryptography)
  systems are based on the assumption that "finding the discrete logarithm of a
  random elliptic curve element with respect to a publicly known base point is
  infeasible" [^1].

  Understanding elliptic-curve cryptography requires deep knowledge of abstract
  algebra which I am totally unqualified to discuss. Practically, all you need
  to know is that there's some squiggly curves which have special properties
  which make things difficult to compute backwards without knowing an additional
  reference point.

Matrix uses elliptic curves for all of its public-key cryptography needs.

[^1]: https://en.wikipedia.org/wiki/Elliptic-curve_cryptography#Application_to_cryptography

## Asymmetric Signatures

In asymmetric encryption schemes, there are two main operations: **encrypt** and
**sign**. We discussed encryption above. The sender uses the public key to
encrypt the data and the private key is used to decrypt the data. Signing on the
other hand uses the _private_ key, and anyone who possesses the _public_ key can
verify the signature.

**Valid signatures can only be created with the private key**, so when we verify
a cryptographic signature, we guarantee that the owner of the private key was
the creator of the signature.

Cryptographic signatures allow other parties to verify that the entity in
control of the private key created the signed data, even if the data itself is
stored on an untrusted medium.

## Hashes and HMAC

A
[cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
is a one-directional function which takes an arbitrarily large set of data and
produces a unique[^2] fixed-size output (called the hash).

**Given the same data, a hash function will always return the same output.**
This allows us to verify that the data did not change in transit (for example,
by a malicious actor).

This property means that hash functions are _deterministic_. However,
determinism has a downside: anyone with the data can create its hash. We also
want to ensure that the hash was created by a party that was in possession of
some secret key so that we know that it was not tampered with in transit. To
accomplish this, we use [HMAC](https://en.wikipedia.org/wiki/HMAC) (how the key
is added is an implementation detail that is not relevant to your understanding
of what functionality HMAC provides).

[^2]: Technically, if you choose a bad hash function like MD5 it is possible to
    create multiple inputs that produce the same hash.

## Key-Derivation Functions (HKDF)

Sometimes, we want to turn a small key into a larger key (or set of larger
keys). For example, we might want to "stretch" a 32-byte shared secret into a
32-byte AES key, a 16-bit AES IV, and a 32-byte HMAC key. In order to do this,
we can use a
[Key-Derivation Function (KDF)](https://en.wikipedia.org/wiki/Key_derivation_function).
The key-derivation function variant that Matrix uses is
[HKDF](https://en.wikipedia.org/wiki/HKDF) which uses HMAC for the key
derivation process.

Another important application of KDFs is to take a sequence of bits which
contains entropy in parts of the sequence and spreads out the entropy into a new
arbitrarily sized sequence (even if the new sequence is smaller than the
original sequence).

## Diffie-Hellman Key Exchanges

Keys for encryption or other purposes like (MAC) need to be shared with both the
sending and receiving parties. This could be done in-person, but that is very
impractical. That's where the
[Diffie-Hellman (DH) Key Exchange](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange)
method comes in. Diffie-Hellman allows us to share a secret key between two
parties over a public, unsecured channel.

Diffie-Hellman uses public-key cryptographic methods which means that it can be
performed using RSA keys or with elliptic-curve keys. Matrix uses the
elliptic-curve version which is called
[Elliptic-Curve Diffie-Hellman (ECDH)](https://en.wikipedia.org/wiki/Elliptic-curve_Diffie%E2%80%93Hellman)
(I know, computer scientists are known for their creativity in naming things).

I'm not going to discuss the actual mathematical mechanism behind ECDH as it's
quite complex and not relevant to understanding Matrix's usage of ECDH. However,
it is essential to understand the properties that it provides. The core feature
of ECDH is that:

\[ \textbf{ECDH}(A_{private}, B_{public}) = \textbf{ECDH}(B_{private},
A_{public}) = K_{shared}. \]

In this equation, we have two public/private keypairs: \(A\) and \(B\). If we
have either one of the _private_ keys and the other _public_ key, we can
generate the same shared secret.

For example, if we have \(A_{private}\) we need \(B_{public}\) and if we have
\(B_{private}\) we need \(A_{public}\).

We will get the same value out of ECDH _regardless of which private key you
have_. You only need the other public key, and public keys that can be spread
around like butter.
