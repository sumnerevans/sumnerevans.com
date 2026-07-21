---
title: Stop Using Conventional Commits
date: 2026-06-02T06:25:00-06:00
categories:
  - Software Engineering
tags:
  - Git
  - Commits
  - Scoped Commits
  - Conventional Commits
---

You've almost certainly encountered
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) before.
It may have reared its ugly head in the changelog of an open source project
you've used. It may have been the enforced commit format for an open source
project you contributed to. A lot of people swear by it. I swear _at_ it.

Even though it is used by
[a](https://github.com/angular/angular/blob/main/contributing-docs/commit-message-guidelines.md)
[large](https://electronjs.org/docs/development/pull-requests#commit-message-guidelines)
[number](https://contribute.freecodecamp.org/how-to-open-a-pull-request/#prepare-a-good-pr-title)
[of](https://jayex.io/community/code/#the-commit-message)
[popular](https://github.com/conventional-changelog/commitlint/blob/master/.github/CONTRIBUTING.md)
[open](https://github.com/semantic-release/semantic-release/blob/master/CONTRIBUTING.md#commit-message-format)
[source](https://github.com/nuxt/nuxt/blob/main/CONTRIBUTING.md#commit-conventions)
[projects](https://github.com/vitejs/vite/blob/main/.github/commit-convention.md),
Conventional Commits is an actively bad standard which
**[encourages focus on the wrong things](#focus-failure) and
[fails to deliver on its promises](#broken-promises)**.

## Focus Failure

Conventional Commits promises to add semantic meaning to commit messages to aid
developers and end-users in understanding the changes made in a commit. However,
Conventional Commits fails to do this in spectacular fashion. To demonstrate
this, let's look at the anatomy of a conventional commit. According to the
[Conventional Commit website](https://www.conventionalcommits.org/en/v1.0.0/#summary)
commit messages should be formatted as follows:

```patch
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit's subject line has a `<type>` (something like `fix`, `feat`, `chore`,
`docs`, or `refactor`[^1]) describing the type of change. Following that, there
is an optional scope, and then a description.

This format has a major failing: **type is prioritised over scope**. This is
exactly backwards.

### Scope > Type

The _scope_ of a change (the subject of the change) is the most important part
of a commit. To demonstrate this, let's consider why each one of the following
stakeholders care about the scope of the change more than the type of the
change:

- **Contributors:** when you are a contributor to a project, you often need to
  read the commit log to identify changes in the codebase relevant to a certain
  area of the code. There are many reasons for this including:

  - Wanting to catch up on what has happened since the last time you
    contributed.
  - Trying to understand where the project's overall inertia is.
  - Looking for commits that might conflict with your in-progress work when
    pulling or rebasing.

  As you read the commit log, you're looking at _what areas_ were touched. You
  really do not care about the _type_ of change happening, you care about the
  _scope_ of the change.

- **Debuggers:** when investigating a bug, you often want to look through the
  commit log to see what changes might have touched areas related to the
  component where the bug manifested. Once again, the scope is the most
  important piece of information. The type of change is entirely useless because
  bugs can be introduced in any change regardless of type. (I'm sure we've all
  experienced writing a bugfix that caused another bug.)

- **Incident responders:** when production is down, scanning the commit log for
  changes that were made around the time of the outage is an effective way to
  identify what areas may be causing the problem. Scope is once again the most
  important piece of information you can have at this point. For example, if you
  see a commit related to the `auth` scope at the tip of the spike of inbound
  API errors, it's a likely culprit for the problem. And once again, type is
  irrelevant because bugs could have been added by any change.

So what does Conventional Commits do? It deprioritises scope so much that it's
_optional_! Why the hell is _scope_ optional? Having a commit without a scope is
like having a sentence without a subject! Then, to add insult to injury,
Conventional Commits elevates _type_ to the front of the commit message.
Conventional Commits gets the priority of scope and type entirely wrong.

### Type is Redundant and Restrictive

You might be thinking "so it may be backwards, but commit type is at least still
important, right?" and to that I say "no". A commit's description should almost
always tell you the type of the change! Consider
[this commit message](https://github.com/angular/angular/commit/ec138c3645f6e28829e69b6da2a839c248bb3bf0)
as an example:

```patch
fix(compiler): prevent namespaced SVG <style> elements from being stripped
```

Even if you only had the description, it's obvious that it was a bugfix! Space
on the subject line of a commit is already at a premium, wasting characters on
the type is not helpful! But it's often even worse than useless; it's often
restrictive. Take
[this commit message](https://github.com/angular/angular/commit/683172b39a602ac9ec15db69d22853433a67a084)
as an example:

```patch
refactor(core): Update webmcp support to use document.modelContext
```

This commit updated the `webmcp` functionality in the `core` component to
support both `document.modelContext` and `navigator.modelContext`, so was that a
bugfix, refactor, or new feature? I would argue it's all of them! But again, the
only thing that really matters is that it was a change to the `core/webmcp`
component.

**Conventional Commits fundamentally focuses on the wrong thing (the commit
type) and devalues the scope (which is what people actually care about).**

## Broken Promises

So we have determined that the format of Conventional Commits sucks, but it must
provide _some_ benefit. Let's read the
[_Why Use Conventional Commits_](https://www.conventionalcommits.org/en/v1.0.0/#why-use-conventional-commits)
section on the
[Conventional Commits website](https://www.conventionalcommits.org/en/v1.0.0/)
to see if any of the reasons make any sense.

- **Automatically generating CHANGELOGs.**

  This is the biggest promise of Conventional Commits: you can run a tool like
  [git-cliff](https://git-cliff.org/) or
  [conventional-changelog](https://github.com/conventional-changelog/conventional-changelog)
  to generate a changelog from the commits since your last release. Is this even
  a good idea? No! The audience of a changelog is entirely different than the
  audience for a commit log!

  A changelog is user-facing, and the user cares about understanding the
  functional differences between versions. They care about what changed from a
  **business/functional** perspective.

  A commit log is developer-facing, and the developers care about reading a
  story of how the codebase has changed over time. They care about what changed
  from a **scope** perspective.

  As you can see, these are two entirely different grains, and any efforts to
  combine them result in subpar results. The reasons for this are multiple:

  - In any moderately complex project, it takes multiple commits to land any
    notable feature. The process of landing the feature (as documented by the
    commit log) is valuable for developers and contributors, but it's useless
    for the end-user. The end-user only cares about the new feature, not how it
    was built!
  - As
    [`richvdh` pointed out](https://richvdh.org/conventional-commits-considered-harmful.html#reverts-are-hard),
    reverts are problematic for Conventional Commits. Revert commits are
    important from a commit log story perspective for developers, but to the end
    user, a change that is reverted is equivalent to a change not made.

- **Automatically determining a semantic version bump (based on the types of
  commits landed).**

  This sounds nice, but the realities of software engineering often interfere
  significantly with the viability of accurately accomplishing this task.
  Consider the following situations:

  - **Reverts:** imagine a situation where the breaking change you introduced
    was actually so breaking that you have to revert it? Your tooling will pick
    up a breaking change and increment the major version even though the
    breakage was actually reverted and there is no breaking change.
  - **Accidental breakages:** maybe the breakage is subtle and you don't realise
    a change is a breaking change when you make the change. Only in retrospect
    realise that it's breaking. You will incorrectly increment a minor/patch
    version when a major version bump is necessary.
  - **Retroactive unbreakages:** say you later add a commit which, in
    composition with a previously breaking commit, results in a diff which is
    not breaking. Similar to the revert situation, tooling would incorrectly
    identify a breaking change.

  In such situations, you could rewrite history with a rebase, but that often
  breaks or is prevented by workflows. It also presents a revisionist history to
  the contributors trying to contribute to the project, reducing the reliability
  of the story the commit log is telling.

- **Communicating the nature of changes to teammates, the public, and other
  stakeholders.**

  As we have established up to this point, teammates and the public have very
  different needs from a changelog and commit log. Conventional Commits manages
  to solve neither.

- **Triggering build and publish processes.**

  This is just a bad idea. Say you only run automated security checks on commits
  that touch code and then someone creates a Trojan-horse commit titled
  `docs: fix typos` which actually introduces vulnerabilities into the
  authentication subsystem? Obviously, that sort of malicious activity would
  hopefully be caught in code review, but the automated tooling is bypassed,
  putting the onus on a human to identify the problem.

  Compute is cheap, just use `git diff` to identify changed files (scope, once
  again) and run build/publish processes based on that.

- **Making it easier for people to contribute to your projects, by allowing them
  to explore a more structured commit history.**

  More structured, sure. Making it easier to contribute? Not at all (as we have
  already demonstrated at length).

Not a single one of the "selling points" for Conventional Commits actually holds
water.

Conventional Commits is also extremely difficult to apply to a project. You are
supposed to define your own set of "types", but pretty much everyone just takes
the defaults from
[commitlint](https://github.com/conventional-changelog/commitlint) which often
don't fit well with the particulars of individual projects. This problem is
especially acute in corporate environments where change management and audit
requirements often mandate a ticket number in every commit message. The
`<scope>` field is the obvious place to put it, but this ends up replacing the
only useful metadata in a Conventional Commit with a completely useless ticket
number.

## A Better Way

So what should you do instead? Follow the lead of truly successful software
projects like Linux, FreeBSD, Git, Go, and NixOS! What do these projects have in
common? They all use scope-prefixed commit messages (where "scope" is defined to
be relevant to the actual project). Usually, the scope to use on a given project
is self-evident. For the Linux kernel, the subsystem is the natural scope. For
Go projects, the package path is the natural scope. For a project using a
microservice architecture, the microservice name is the natural scope.

Here are some examples of projects and their commit format guidelines.

| Project                                                                                                         | Format                   | Example                                                                                                                                 |
| :-------------------------------------------------------------------------------------------------------------- | :----------------------- | :-------------------------------------------------------------------------------------------------------------------------------------- |
| [Linux](https://www.kernel.org/doc/html/v4.14/process/submitting-patches.html)                                  | `subsystem: description` | [`i2c: virtio: mark device ready before registering the adapter`](https://github.com/torvalds/linux/commit/1d774589f924)                |
| [FreeBSD](https://freebsdfoundation.org/wp-content/uploads/2020/11/Writing-Commit-Messages.pdf)                 | `prefix: Description`    | [`linuxulator: Return EINVAL for invalid inotify flags`](https://github.com/freebsd/freebsd-src/commit/f77d37cffdf3)                    |
| [Git](https://git-scm.com/docs/SubmittingPatches)                                                               | `area: description`      | [`gitlab-ci: update macOS image`](https://github.com/git/git/commit/62319b49bbe7)                                                       |
| [Go](https://go.dev/wiki/CommitMessage)                                                                         | `package: description`   | [`net/http/cookiejar: add godoc links`](https://github.com/golang/go/commit/517d4d3c7976)                                               |
| [nixpkgs](https://github.com/NixOS/nixpkgs/blob/master/CONTRIBUTING.md)                                         | `pkg-name: description`  | [`xwayland: 24.1.11 -> 24.1.12`](https://github.com/NixOS/nixpkgs/commit/7bf858875a54)                                                  |
| [Node.js](https://github.com/nodejs/node/blob/main/doc/contributing/pull-requests.md#commit-message-guidelines) | `subsystem: description` | [`stream: fast-path stateless transform flush results`](https://github.com/nodejs/node/commit/5f727fdc89c06782652bfbf6a4d05ade1db3d2c8) |

Unfortunately, despite being used by some of the most successful open source
projects ever created, this commit style seems to have lost the branding war. I
intend to change that. Introducing
[scopedcommits.com](https://scopedcommits.com). The website is dedicated to
advocating for a return to commit message sanity, and separating the concern of
changelog generation from commit log management.

## Conclusion

Conventional Commits' purported advantages are actually illusory and the
industry has seen no tangible benefit from using it as a standard. However,
Conventional Commits unfortunately seems to have become fairly popular in open
source projects, and due to this it seems like AIs have a habit of defaulting to
using it for commit messages. This has caused propagation of anti-pattern-ridden
commit messages across projects.

My goal in this article is to fight against Conventional Commits' dominance, and
demonstrate that there better ways to structure commit messages. But if this
article has not convinced you to stop using Conventional Commits, I look forward
to the flame war in the comment section.

[^1]: Technically, the Conventional Commits specification only defines `fix` and
    `feat` and leaves additional types up to individual projects to specify,
    however most projects just end up using the types
    [defined by commitlint](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional#type-enum),
    so I have included some of them in this list.
