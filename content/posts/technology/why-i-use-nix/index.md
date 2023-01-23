---
title: Why I Use Nix
date: 2021-04-29T17:00:00-0600
categories: [Technology]
tags: [Nix, NixOS, Functional Programming, Declarative, Open Source]
draft: true
---

It's the dream of every programmer and system administrator: **deterministic
runtime environments**.

The rise of technologies such as Docker, Electron,
and Flatpak all point to the desire to have a immutable system.

deterministic set of dependencies

NixOS is an ecosystem of a powerful functional language: Nix, a set of packages
built using said language (nixpkgs), and a bunch of modules for configuring
operating systems (also within nixpkgs). Like Gentoo, NixOS is source-based, but
it uses hashes for everything to ensure build inputs are consistent, and has a
binary cache so you don't have to build your system from scratch (you can rely
on builds done by others).

NixOS allows you to declaratively define your system and reproduce it reliably
across systems. NixOS is leading the way on the reproducible builds initiative.
Nixpkgs boasts a very impressive package set (rivaling Arch + AUR).

NixOS is literally the second coming of Haskell Curry. The Nix language is the
best language to ever grace the face of the earth.

We are literally going to take over the world as soon as we figure out how to
run the pre-compiled "take over the world" binaries that don't work due to the
weird way NixOS does dynamic linking.
