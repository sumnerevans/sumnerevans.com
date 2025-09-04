---
title: Vibe Coding Doesn't Require LLMs
date: 2025-08-10T06:25:00-06:00
categories:
  - Software Engineering
  - Programming
tags:
  - Vibe Coding
  - LLM
aliases:
  - /posts/programming/vibe-coding-doesnt-require-llms
---

I recently read
[_I Know When You're Vibe Coding_](https://alexkondov.com/i-know-when-youre-vibe-coding/)
by [Alex Kondov](https://alexkondov.com/) in which he described certain
characteristic "smells" of vibe-coded software. For example, he points to LLMs
proclivity to pave their own path and go against established patterns within a
project.

The article resonated with me, but I realized that it resonated with me at a
deeper level than just explaining my interactions with LLM-written software. I
realized that _I've seen these "smells" before in pre-LLM software (especially
that written by students)._

So what is the common thread between these student-produced and LLM-produced
code-smells? Kondov alludes to the reason in the conclusion of his post where he
argues that we need to care about the quality, consistency, and maintainability
of the software that we write.

I suggest that **vibe-coding smells emerge wherever the entity writing the code
doesn't care about the software it writes**. LLMs by definition cannot "care".
Students have an amazing capacity to not care about the thing they are
ostensibly meant to learn. Even some professionals don't seem to care about the
software they write.

Thus, I suggest that in reality, vibe coding has existed for as long as the
software industry has been populated with people who don't care about the
software they write. It just so happened that in a pre-LLM world, those who
didn't care were rarely able to produce anything that even compiled, much less
that worked. LLMs have merely made it easier for those who do not care to
produce seemingly working software.

I am still forming my thoughts on how I believe that LLMs will change the
software industry. It's clear that LLMs make the act of writing code quicker,
but I believe that
[writing code was never the bottleneck](https://ordep.dev/posts/writing-code-was-never-the-bottleneck).
I also see LLMs lower the activation energy required to prototype solutions, but
productionising code is always the hardest part. LLMs may make us faster at
delivering software, but solving the customer's problem is always the real goal.
However, there is one thing I am certain of: **code produced by people who care
about the software they write will always be better than software written by
people who don't care, regardless of how the code is produced.**
