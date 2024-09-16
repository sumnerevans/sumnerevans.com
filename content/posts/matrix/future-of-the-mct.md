---
title: On the Future of the Matrix Core Team
date: 2024-08-14T06:25:00-06:00
categories:
  - Matrix
tags:
  - Matrix Governing Board
  - Matrix
  - Matrix Foundation
description: |
  In the past
draft: true
---

<div class="admonition important">
<p class="first admonition-title">Disclaimer</p>
<p class="last">

This document was written by me as an individual member of the Matrix community.
This document is solely my opinions and does not reflect the position of his
employer (Automattic) nor that of Beeper. This document is primarily written for
an audience consisting of Matrix Foundation Governing Board members, but is made
public for the sake of the rest of the community.

</p>
</div>

When I
[ran for the Matrix Governing Board]({{<ref"./2024-matrix-governing-board.md">}})
one of the primary tenants of my platform was to
[clean up the `matrix-org` GitHub
organization]({{<ref"./2024-matrix-governing-board.md#clean-up-the-matrix-org-github-organization">}}).
Since
[being elected to the Governing Board](https://matrix.org/blog/2024/06/election-results/)
I have had the opportunity to be a part of many fruitful conversations about the
Foundation and its relationship to the projects within the `matrix-org` GitHub
organization. In these discussions, the term **Matrix Core Team (MCT)** kept
coming up. The MCT was described as the entity which asked thirdroom to come
under the `matrix-org` GitHub organization, for example. However, I didn't
really know what the MCT even meant, let alone what its responsibilities and
privileges entailed, and I embarked on a journey to answer that question.

In this article, I provide my understanding of what the MCT is currently, and
propose that the term be deprecated in favour of **Matrix Core Projects** and a
**Matrix Core Security Team**.

This article is a follow-up to the
[_Let's discuss: What projects belong in the Foundation, and what is core?_](TODO)
blog post which was published on the Matrix.org blog. Josh Simmons and Matthew
Hodgson wrote the first draft and the Governing Board was consulted and had
extensive discussions about the contents of the final post. The main purpose of
the post was to define a framework for discussing what it means for a project to
be "core" to the Foundation. This post is a response to the call for feedback
and the comments can serve as an avenue for me as a community representative on
the Governing Board to gather feedback from my constituents.

## What Is the MCT?

The MCT is defined in Section 3.2 of the
[<i class="fa fa-file-pdf-o"></i> Matrix.org Foundation Rules](https://matrix.org/media/2019-06-10%20-%20Matrix.org%20Foundation%20CIC%20Rules.pdf)
as

> those individuals within the Matrix community with access to commit code to
> the public Matrix.org repositories (e.g. <https://github.com/matrix-org>).

(Note that the MCT is called the "Code Core Team" in that document as that was
the historic name for the MCT.)

The responsibilities of the MCT are elaborated in Section 3.7.

Additionally, a few weeks ago, in
[<i class="fa fa-file-word-o"></i> What is the Matrix Core
Team](https://docs.google.com/document/d/1zMMSjUD2JUFl4jlc6QJfgNMkz-iyBwKvITLmVpJ2zyw/edit#heading=h.6pghk146f3si),
Matthew clarified his understanding of the MCT.

## Problems With the MCT

In my discussions with community members (including a few who are MCT members by
the definition in the Rules) most people do not understand who is on the MCT nor
what their responsibilities are. Some believe that the MCT doesn't exist as a
meaningful entity. Others understand and agree with the definition of the MCT,
but are unclear about the actual privileges and responsibilities that membership
confers. What is clear to me is that the MCT is not widely understood.

I would like to go one step further and assert that, even if everyone knew the
definition of the MCT, its existence is pointless.

The diversity of the projects in the matrix-org GitHub organization is
large[^1]. People with commit access to a particular repository (or set of
repositories) only have expertise in those projects. The term "MCT member"
doesn't mean that the individual is an expert in Matrix as a whole. It only
means that individual has demonstrated trustworthiness within the context of the
specific projects they have commit access to.

[^1]: Whether or not that is a good thing is up for debate.

**MCT members have gained trusted positions within their respective projects,
but that does not mean that they have cross-project authority.** I worry about a
potential infiltration of the MCT where an individual (think, Jia Tan) becomes a
committer in a security-non-critical project, and then runs around claiming
authority as an MCT member in security-critical projects. So far this has not
been a problem (mainly because barely anyone actually understands the MCT), and
I think that there are enough community members who would raise an alarm.
However, this situation does indicate an issue with the definition of the MCT:
there is no distinction about _what projects_ an MCT member has authority in.

In addition to being ill-defined and having issues with clarity about the level
of authority of its members, the MCT doesn't act as a team. As far as I can
tell, the MCT does not have meetings. The MCT definitely does not publish any
unified goals or updates (unlike the Spec Core Team (SCT) which does so
regularly). Thus, applying the "duck test"[^2] to the MCT fails since it does
not do anything that a "team" would be expected to do. Calling a set of people
who don't behave as a team but who happen to be maintainers of a diverse set of
projects a "team" is pointless. **It's like calling Mark Zuckerberg, Elon Musk,
and Shou Zi Chew the "Social Media Core Team"[^3]!**

[^2]: If it walks like a duck and quacks like a duck, then it's a duck.

[^3]: And even calling Zuckerberg, Musk, and Chew a team may be more justified
than putting the maintainers of
[vodozemac](https://github.com/matrix-org/vodozemac) and
[mscbot-python](https://github.com/matrix-org/mscbot-python) in the same
category. At least Zuckerberg, Musk, and Chew are sometimes called to congress
to testify about their collective expertise in social media!

I do want to address the main argument for _keeping_ the MCT which is that "the
MCT represents a set of trusted core contributors to Matrix, many of whom have
been around since the beginning of the project". However that set of
contributors are already well-known in the community and do not need a special
title to maintain their respected position within Matrix. Additionally, the
authority of the MCT as a group has been so diluted by the myriad of projects
within the matrix-org GitHub organization that it's not even clear that only
trusted core contributors are a part of the MCT.

## What We Actually Need

I'm going to now describe a few things which I think the matrix-org GitHub
organization needs. Some of these were implicit responsibilities of the MCT, but
some were not.

- We want to guarantee that the projects within the org are secure and high
  quality.
- We want people to confidently use anything within that GitHub organization in
  their projects.
- We want people to understand which projects the Foundation will try and
  maintain at all costs (even if that means competing with forks).
- We want the projects within the org to reflect generally useful projects to
  the entire ecosystem.

## Proposal

Due to the problems described in the first section and the needs I listed in the
previous section, I propose that we deprecate the term _Matrix Core Team_ in
favour of talking about **Matrix Core Projects**. I further propose that we
formalize a **Matrix Security Core Team**.

### Matrix Core Projects

I have already argued that the authority of members of the MCT is scoped to the
_projects_ they have commit access to. It seems clear that _projects_ are what
should matter to the Foundation.

As such, I propose that the Foundation establish a set of Matrix Core Projects
(or maybe Core Matrix Projects, naming is hard). Each project would have its
governance structures for determining who has commit access, who makes final
decisions about the project, etc. In order for a project to be considered a
Matrix Core Project, the projects would need to be evaluated by the Foundation.
The criterion to be considered is something that we as the Governing Board
should discuss, but I can think of a few important criteria right away:

- Ensure that the individuals running the projects are themselves trustworthy.
- The governance of the project aligns with the Foundation's ideals and goals.
  (One example of alignment could be agreeing to be overseen by the Matrix Core
  Security Team that I define in the next point.)
- The project itself is of good quality.
- The project is generally useful to the Matrix ecosystem.

The Foundation could help provide governance to the individual projects, and in
the future hopefully the Foundation will be able to provide funding as well.

### Matrix Core Security Team

The Matrix Foundation must guaranteeing that the Matrix Core Projects are vetted
for security. I propose establishing a Matrix Core Security Team whose sole
responsibility is to oversee the security of the Matrix Core Projects.

This team should be comprised of security experts. Membership in this team
should be heavily guarded, similar to how membership in the Matrix Spec Core
Team (SCT) is guarded. Precise eligibility requirements for the Matrix Core
Security Team is something that the Governing Board should discuss.

The Matrix Core Security Team should establish rules for what types of things
Core Projects need to have reviewed by a team member. This will likely vary
greatly between projects. Almost everything in Vodezemac needs to be reviewed by
a Core Security Team member (or multiple) while changes to the matrix.org
website will likely rarely need any review from the team.

## Conclusion
