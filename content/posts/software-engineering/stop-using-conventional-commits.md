---
title: Stop Using Conventional Commits
date: 2026-05-30T06:25:00-06:00
categories:
  - Software Engineering
tags:
  - Git
  - Commits
  - Conventional Commits
draft: true
---

You've almost certainly encountered
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) before.
It may have reared its ugly head in the changelog of an open source project
you've used. It may have been the enforced commit format for an open source
project you contributed to. A lot of people swear by it. I swear _at_ it.

Even though it is used by
[a](https://github.com/angular/angular/blob/main/contributing-docs/commit-message-guidelines.md)
[large](https://electronjs.org/docs/development/pull-requests#commit-message-guidelines)
[number](https://contribute.freecodecamp.org/how-to-contribute-to-the-codebase/)
[of](https://jenkins-x.io/community/code/)
[popular](https://github.com/conventional-changelog/commitlint/blob/master/.github/CONTRIBUTING.md)
[open](https://github.com/semantic-release/semantic-release/blob/master/CONTRIBUTING.md)
[source](https://github.com/nuxt/nuxt/blob/main/CONTRIBUTING.md)
[projects](https://github.com/vitejs/vite/blob/main/.github/commit-convention.md),
Conventional Commits is an actively bad standard which
**[encourages focus on the wrong things](#focus-failure) and
[fails to deliver on its promises](#broken-promises)**.

## Focus Failure

Conventional Commits are supposed to add semantic meaning to commit messages to
aid developers and end-users in understanding the changes made in a commit.
However, Conventional Commits fails to do this in spectacular fashion. To
demonstrate this, let's look at the anatomy of a conventional commit. According
to the
[Conventional Commit website](https://www.conventionalcommits.org/en/v1.0.0/#summary)
commit messages should be formatted as follows:

```
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
of a commit to every single stakeholder.

TODO fill this out

- Contributors:
- Reviewers:
- Debuggers:

So what does Conventional Commits do? It deprioritises scope (the most important
part of a commit message) so much that it's _optional_! Why is _scope_ optional?
Having a commit without a scope is like having a sentence without a subject!
Then, to add insult to injury, Conventional Commits elevates _type_ to the front
of the commit message. Conventional Commits gets the priority of scope and type
entirely wrong.

### Type is Redundant

You might be thinking "so it may be backwards, but commit type is at least still
important, right?" and to that I say "no". A commit's description should always
tell you the type of the change!

- This avoids having to categorise into a small set of types. There are as many
  types of changes as there are changes.
- And if you need to use an automated tool to search types, just use AI which
  can now do analysis of commit messages to determine what kind of a change it
  was.

## Broken Promises

- Automatically generating CHANGELOGs.
- Automatically determining a semantic version bump (based on the types of
  commits landed).
- Communicating the nature of changes to teammates, the public, and other
  stakeholders.
- Triggering build and publish processes.
- Making it easier for people to contribute to your projects, by allowing them
  to explore a more structured commit history.

Don't use commit messages to make your changelog

Additionally, it is extremely easy to misapply Conventional Commits, especially
in corporate situations resulting in completely useless commit messages.

You often don't realise it's breaking when you make the change, and only in
retrospect realise that it's breaking. Also, what if you make a breaking change
that later has a commit which adds support for legacy?

## Alternatives

So maybe I've convinced you to stop using Conventional Commits, what should you
use instead?

The NixOS commit style.

## Conclusion

Conventional Commits unfortunately seems to have become a de-facto standard
across open source projects, and due to this it seems like AIs have a habit of
defaulting to using it for commit messages. This has caused propagation of
anti-pattern-ridden commit messages across projects. However, the industry has
seen no tangible benefit from using Conventional Commits because its purported
advantages are actually illusory.

My goal in this article is to fight against Conventional Commits' dominance, and
demonstrate that there are better way to structure commit messages. But if this
article has not convinced you to stop using Conventional Commits, I look forward
to the flame war in the comment section.

[^1]: Technically, the Conventional Commits specification only defines `fix` and
    `feat` and leaves additional types up to individual projects to specify,
    however most projects just end up using the types
    [defined by commitlint](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional#type-enum),
    so I have included some of them in this list.
