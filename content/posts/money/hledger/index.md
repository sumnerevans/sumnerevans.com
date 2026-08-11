---
title: Plain Text Accounting is Pretty Cool
date: 2026-07-24T06:25:00-06:00
categories:
  - Money
tags:
  - Plain Text Accounting
  - Plain Text
  - Accounting
  - hledger
draft: true
---

I like to keep track of my finances pretty religiously. I started by using Mint
(may it rest in peace) and then switched to
[Rocket Money](https://www.rocketmoney.com/). Eventually I got annoyed with it
and ended up keeping track of everything manually in markdown files in a git
repo for a few years. Last year, I started using
[Origin](https://useorigin.com/) which has been pretty good. However, recently I
started looking for a new solution due to a few reasons:

1. I have wanted to convert my personal finances to use double-entry
   bookkeeping.
2. Origin (like Rocket Money and Mint before it) has issues staying connected to
   all my accounts reliably.
3. Origin does not handle closed accounts very well (closed credit cards/bank
   accounts/loans).
4. Origin does not allow me to categorise 401(k) contributions as "income" and
   include it in my savings rate calculations.
5. None of the applications handle yearly/biannual expenses especially well.

This led me back to using files in a git repo, but I wanted to get away from the
very non-scalable markdown files. I didn't want to use a GUI system like
[gnucash](https://gnucash.org/) because I think it's really ugly. After some
research with Claude, I was introduced to a new system called
[Plain Text Accounting](https://plaintextaccounting.org/) which is a way of
doing bookkeeping and accounting with plain text files.
