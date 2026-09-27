---
title: How I Want to Use AI
date: 2026-09-25T06:25:00-06:00
categories:
  - Software Engineering
tags:
  - AI
  - LLMs
math: true
---

> [!ABSTRACT] TL;DR
>
> The chat-based workflow encouraged by existing AI harnesses results in a
> fragmented source of truth for the desired functionality of the software.
>
> To centralise the source of truth, we should use Markdown as Source (MaS). We
> should adopt a Specify, Generate, Inspect, Loop (SGIL) workflow which puts
> human-written Markdown files stored in source control front-and-centre.

## My Current AI Workflow

I _hate_ my AI workflow. I don't know how everyone else is using AI, but
currently my workflow looks something like:

1. Open Claude and type a chat message indicating what I want it to do.
1. Look at the code or plans it generates and test the functionality of the code
   it produced.
1. Type a chat message clarifying my ask or correcting the AI's assumptions.
   Normally this involves telling it what I dislike about the code it generated.
1. Go to 2.

<!--more-->

Sometimes, I even have another agent or two in the loop that I'm chatting with
simultaneously about additional features or bugs in the code or plans the AI has
written.

By the time I get a few chat messages in, the things I've sent are entirely
disjointed, likely contradictory, and certainly only useful in aggregate.
Somewhere across the hundreds of messages that I've written across dozens of
chat windows, a (hopefully complete) picture of the code I intend to be written
can be derived. I'm honestly surprised at how effective AI is at actually
figuring out what I was asking of it.

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

## The Problems

One of the most obvious problems with the chat-based AI workflow is that it
exposes a great asymmetry between human ability and AI ability in text
generation. I may send a terse and poorly worded message to the AI but the AI
will happily return a massive wall of well-structured (albeit possibly
bullshit[^1]) prose. For me, this creates text fatigue.

Additionally, dealing with chat all day is especially difficult for introverts
(of which there is no shortage in the software industry). Chat-based workflows
push the software engineering process through the social-processing part of our
brains because chat (even with an AI) is fundamentally a social act.

But worse than the text and social fatigue is the fact that reviewing the code
is nearly impossible. The things that I care about in a code review are the
human decisions made when creating a change (hopefully driven by the business
needs). However, with chat-based workflows, these decisions are not committed to
source control. Instead, the human decisions that constitute the source of truth
for what the code should look like are distributed across a myriad of chat
messages. Re-deriving the set of decisions which led to the code being the way
it is would require auditing the entire chat log across every conversation.
However, naively looking at just the human-written messages is not enough: you
have to scrutinise the temporal context of each message, understanding the state
of the codebase and development environment at the time of the message.

_The fundamental problem with chat-based AI workflows is having a fragmented
source of truth._

[^1]: Hicks, M.T., Humphries, J. & Slater, J. ChatGPT is bullshit. _Ethics Inf
    Technol_ 26, 38 (2024). [DOI](https://doi.org/10.1007/s10676-024-09775-5)

## Markdown as Source

Luckily, software engineers know how to deal with fragmented sources of truth:
we create a single source of truth!

**I propose that single source of truth should be _human-written Markdown files
stored in source control_.**

I came to this conclusion after reading
[_Markdown in /src_](https://htmx.org/essays/Markdown-in-src/) in which Carson
Gross (of HTMX fame) argues that human-written documents should be committed to
source control to capture the intent and decisions behind the (largely
AI-generated) code. Carson argues that Markdown is becoming source code. I
agree.

I propose we call this paradigm of using human-written Markdown files as the
source of truth for a programs functionality _Markdown as Source_ (or _MaS_ for
short, because all good things in software engineering have a funny acronym).

The natural next question is: _what do our workflows look like under this
paradigm?_

LLMs are not compilers, but I think we can look to how we utilise compilers in
our workflows for inspiration about how we might wish to interact with a system
that implements the MaS paradigm.

| **Compiler Paradigm**                                                                         | **Markdown as Source Paradigm**                                                                 |
| --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| Compilers take code files as an input.                                                        | MaS systems should take Markdown files as input.                                                |
| Compilers provide helpful errors when the code files are malformed.[^3]                       | MaS systems should explain why the Markdown files are unclear, contradictory, or incomplete.    |
| Compilers don't ask you for additional input if the compilation fails.[^4]                    | MaS systems should not ask you to make decisions as it generates code.                          |
| Compilers provide warnings for potential problems, even if the compilation suceeds.           | MaS systems should surface potential issues and assumptions it has made during code generation. |
| We don't edit the output of a compiler, we edit the code files that generated the output.[^2] | We shouldn't edit the code the LLM generates, we should edit the Markdown files.                |
| We don't do code-review of the compiler output, we review the code files.                     | We (maybe?) shouldn't review the output of a MaS system and instead review the Markdown files.  |

Regarding the last point, I currently do not review any `.md` files and instead
I review the code, but this paradigm would change that. I don't know if that is
common practice or not, but a reviewer under the MaS paradigm should not neglect
to scrutinise the Markdown files. I anticipate that we will still review the
code output by the MaS systems for a while, but I think that the days of this
are numbered.

Because we edit the Markdown files to edit the code, we will also have to review
diffs between Markdown file versions. This can serve as clear documentation for
business logic changes (something that is sorely lacking, even in pre-AI code).

So what does this paradigm shift demand of the tools we use? I suggest that the
next generation of AI tooling should be based around a SGIL workflow.

[^2]: This is the case even when we need to hand-write the assembly: the inlined
    assembly goes into the source code, it doesn't get injected by hand into the
    output after the fact.

[^3]: Unless you screw up your C++ templates, then you just have to give up.

[^4]: Ignore the \(LaTeX\) compilers...

## Specify, Generate, Inspect, Loop

Interacting with existing AI harnesses feels like programming in a
[REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop).
Nobody ships code written in a REPL to prod, but it feels like that is what we
are doing with chat-based AI workflows: we repeatedly type instructions into a
small chat textbox and pray.

Instead, the source of truth (the human-written Markdown files) should be
front-and-centre and the software engineering workflow should be:

- _**Specify**_ the desired functionality in the source of truth Markdown files.
- _**Generate**_ code using an LLM, outputting generation errors and warnings in
  addition to the underlying source code.
- _**Inspect**_ the resulting errors, warning, and generated code and test its
  functionality.
- _**Loop**_ back to Specify to refine or correct the source of truth.

The acronym for this workflow is of course _**SGIL**_ (pronounced "skill"[^5]).

I'm sure that this workflow is possible, but it's definitely not the default
flow encouraged by the existing AI harnesses.

## How Do We Get There?

I propose a few concepts which might be helpful for adopting a MaS paradigm and
implementing a SGIL workflow. These are very speculative.

- Adding structure to the _Specify_ step may be helpful. Carson
  [proposed a `/src/md` convention](https://htmx.org/essays/Markdown-in-src/#a-proposed-src-md-convention).
  I think we could also draw inspiration from the structure of
  [Claude Skills](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview).
- The files created in _Specify_ step should be largely human-written. This
  point is
  [also argued by Carson](https://htmx.org/essays/Markdown-in-src/#what-src-md-Markdown-looks-like).
  Maybe AIs will get good enough to do this step on their own at some point in
  the future, but in its current state, human curation is still necessary during
  specification.
- The _Generate_ step should be run without context about the existing
  implementation: it should only be given the specification (and possibly some
  additional metadata about output location). This step is fairly token
  expensive, however we can short-circuit it whenever there is ambiguity and
  raise "generation errors" instead of trying to decipher the user's intent.
- That being said, the _Generate_ step may benefit from a concept analogous to
  [incremental compilation](https://en.wikipedia.org/wiki/Incremental_compiler).
  Many changes to a specification will not necessitate a full regeneration of
  the code due to being localised or mechanical.
- The _Generate_ step should be sandboxed, but have access to any tools it needs
  (CLI programs, internet, etc.) so that it can use software to generate
  software. This is also probably more token-efficient than requiring the AI to
  output working code directly from its context.
- The output of the _Generate_ step should be made in a way to make the
  _Inspect_ step easy to accomplish. This may involve new ways of structuring
  code to make it clear which part of the specification caused the code to be
  generated the way it was.
- The _Inspect_ step (especially the testing aspect) can be AI-assisted,
  however, it should be a separate agent adversarially testing what the
  generation agent created.
- I hope in the future, the _Loop_ happens as you type. I want to be able to
  just start typing `This is a Go project` into a Markdown file and have the AI
  create Go project scaffolding, then when as soon as I add
  `that provides an HTTP service`, the AI updates the generated Go code to
  expose an HTTP server. I don't think the speed is there yet, so we will have
  to survive with an explicit invocation of the _Generate_ step for a while.
- Retroactively writing a Markdown specification for an existing program is
  something that can probably be done by AI agents without a human in the loop.
  Specification agents can be used to create specifications, then the _Generate_
  step can be run. Inspector agents can then compare the generated code to the
  existing project's source code and provide feedback to the Specification
  agents. I still think that humans should hand-write any modifications to the
  Markdown source after this process is complete, but this may be a way to get
  an existing codebase to be usable under a MaS paradigm.
- Chat-style AI harnesses are going to continue being useful, much like REPLs
  have their place for quick experimentation and computation, so too will
  chat-based AI harnesses.

[^5]: We really have to reclaim the word "skill", it's so lame that it now just
    refers to some text in a Markdown file.

## Conclusion

I think that treating Markdown as source can centralise our currently-disjointed
sources of truth into a single place, and I think building tools that encourage
a SGIL workflow will help direct human effort to where it is most valuable. You
may not want this workflow and you may not like the paradigm I am proposing, but
this is how I wish AI worked.

My goal with this article is to put my thoughts together and see if anyone else
has had similar ideas. I doubt that what I am proposing is novel, and I'm pretty
sure that something like what I want exists. However, I haven't found it. This
paradigm and workflow are definitely not the obvious way to use the existing AI
tools. If there are any tools which implement this workflow, I'd love to hear
about them in the comments so that I can stop using my current workflow.

<!--
Right now, it feels like we are in the wild west of AI usage across the
industry. We are writing code faster than ever before, but there hasn't been a
fundamentally paradigm shift in software creation. The rest of the software
engineering workflows have not caught up to the speed of AI at generating code,
resulting in bottlenecks in requirements, design, review, releases, and other
non-code aspects of software engineering.

Are we just reinventing programming languages? Maybe.

I believe this process will help professionalise the wild west of using AI.
-->
