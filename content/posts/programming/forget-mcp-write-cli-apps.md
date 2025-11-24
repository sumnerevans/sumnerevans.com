---
title: Forget MCP, Write CLI Apps
date: 2025-11-22T06:25:00-06:00
categories:
  - Programming
tags:
  - CLI
  - LLM
  - MCP
  - Claude
draft: true
---

Over the last month or so, I've been using
[Claude Code](https://claude.com/code) for assisting with development tasks[^1].
One of the things that has confused me the most about the LLM-assisted
programming ecosystem is the
[Model Context Protocol (MCP)](https://modelcontextprotocol.io/docs/getting-started/intro)
landscape. In theory, MCP is a way to provide the LLM with data from an external
system through a structured protocol. However,
[it sucks](https://youtu.be/1piFEKA9XL0). It turns out that it is more efficient
to have the AI just write code to interact with and manipulate the data from the
external system directly. Rather than piping of the data from the external
system into the prompt context window and letting the LLM muddle through it, the
LLM-written code can just do the necessary data processing.

But what would be even better than having the AI write ad-hoc code to interact
with the external system? Just provide a fully-featured CLI for that external
system! With a competently built CLI application, the LLM does not have to guess
about the functionality of the external system when writing ad-hoc code.
Instead, it can interact with it in a highly-structured, text-based way via the
command line.

We should let computers do what they are good at: running a set of instructions
on a large dataset that output a deterministic result.

Claude in particular likes leveraging GitHub's CLI

Claude is a command line application and interacts with the codebase via command
line tools. Because of this, I've noticed a stark difference between working
with Claude on Windows with .NET Framework and working with Claude on Linux with
Go.

Linux and Go are both designed to be interacted with via the command line,
whereas Windows and .NET are most definitely not. (.NET is getting better since
.NET Core, but for work we are still on .NET Framework which means that not all
of the new command line tooling works.)

More broadly, applications which have well-designed command line user interfaces
are more amenable to be integrated into AI workflows. Thus, I think that the
best way to make an application AI-ready is to give it a really good and
well-documented text-based UX.

With the push towards Model Context Protocol,

[^1]: We have chosen Claude as the AI of choice at
    [my job]({{<ref"../../portfolio/index.md#experience-canam-tech-lead">}}) and
    I have been using it both at work and for some side projects.
