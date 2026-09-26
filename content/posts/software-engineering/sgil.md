---
title: "SGIL: How I Want to Use AI"
date: 2026-09-25T06:25:00-06:00
categories:
  - Software Engineering
tags:
  - AI
  - LLMs
draft: true
---

## My Workflow

I hate my AI workflow. I don't know how everyone else is using AI, but currently
my workflow looks something like:

1. Open Claude and type a chat message indicating what I want it to do.
1. Look at the code or plans it generates and test the functionality of the code
   it produced.
1. Type a chat message clarifying my ask or correcting the AI's assumptions.
   Normally this involves telling it what I dislike about the code it generated.
1. Go to 2.

Sometimes, I even have another agent or two in the loop that I'm chatting with
simultaneously about additional features or bugs in the code or plans the AI has
written.

By the time I get a few chat messages in, the things I've sent are entirely
disjointed, likely contradictory, and certainly only useful in aggregate.
Somewhere across all of the messages that I've written, a (hopefully complete)
picture of the code I intend to be written can be derived. I'm honestly
surprised at how effective AI is at actually figuring out what I was asking of
it.

Sometimes I ask the AI to create plan documents so that it doesn't get confused
across context compressions or different chat windows. I treat the intermediate
documents as ephemeral, per-feature memory, and don't keep them in source
control.

The real output I care about is the code that eventually gets produced through
this chat-driven process. I then have to pretend to understand what the code
does. I also have to hope that I remembered to tell the AI all the relevant
information in the various messages, and that it didn't lose track of anything
or get confused by my meandering and often contradictory instructions.

This workflow seems like it is the workflow encouraged by the current set of AI
coding tools: the first thing all AI harnesses present to you is a chat textbox.

## The Problem

I think the biggest reason I dislike this workflow is that the source of truth
for what the code should be is distributed across a ton of chat messages.

It also gives me text fatigue.

It also drains my introvert brain.

It feels like I'm programming using a REPL and then shipping it to prod.

I think that this process is entirely broken, and

The artefacts that actually had human effort put into them are nowhere to be
found (they are chat messages).

The artefacts that the AI generates are also not in source control (although
they are likely less insightful than the human-written stuff).

## SGIL

A few days ago, I read
[_Markdown in /src_](https://htmx.org/essays/markdown-in-src/) by Carson Gross
of HTMX fame in which he argues that the spec

I realised that I want to treat AI like a compiler: I want it to convert my
hand-written specification to code. I don't want to direct it mid-compile: I
want it to explode with "compile" errors when it doesn't think I described
things in enough depth.

Everyone keeps talking about "loops" but the loop that I want to use is:

- **S**pec
- **G**enerate
- **I**nspect
- **L**oop

or **SGIL** (pronounced "skill", because we have to reclaim the word "skill"
from just being "a collection of markdown files").

I want to change the way I use AI

I want to change the way I use AI for software engineering tasks.

How I want AI to Work

Up to this point in my (short) career of using AI, I've utilised chat-driven
development. I prompt Claude in a chat window (either command line or desktop
app) and then when I see a change I want to make I send another message to the
AI. The problem with this approach is that the source of truth for what the
program does is splattered around hundreds of messages in various chat windows,
AI-written documentation, your wiki and ticket management systems, etc.

I keep hearing about spec-driven development, but nobody seems to actually do
that, and the tooling for it is ass.

Most people who use AI do chat-driven development. The source of truth for what
the program does gets splattered around

Everyone keep talking about spec-driven development, but when I look under the
hood, what I see is really chat-driven development.

The current way we work with AI sucks.

I start a technical spec document which outlines business cases and desired
interactions, architectural decisions, etc.

As I edit the doc, the code is auto generated using the spec I gave. So like
when I start out with "This Go service" I will get scaffolding for a go project
and then I type "exposes a rest API" it would put the scaffolding up for the
http stuff and then I type "using mautrix/go-util http utilities" it would make
it use mautrix/go-utils

In order for us to use English as the new code, we need (a) determinism and (b)
the new code (the markdown files) must fully contain all the decisions about the
code that matter, so that we can diff it. sumner — 11:56 AM Spec, gen, inspect,
loop sumner — 6:50 PM optimize for review time
