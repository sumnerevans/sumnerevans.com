---
title: My Matrix Governing Board Platform
date: 2024-04-24T03:25:00-06:00
categories:
  - Matrix
tags:
  - Matrix Governing Board
  - Element
  - Matrix
  - Matrix Foundation
  - Chat
  - Cryptography
description: |
  I'm running for the Matrix Governing Board as an Individual Member. My
  platform is to encourage a focus on chat by increasing ecosystem diversity.
aliases:
  - ../technology/2024-matrix-governing-board
---

> [!TASK] Election Results
>
> **2024-06-03**: The results of the first Governing Board Election have been
> [posted on the Matrix.org Blog](https://matrix.org/blog/2024/06/election-results/).
>
> I am grateful that I was elected as an individual member. Thank you to those
> who voted for me!

I'm
[running for the Matrix Governing Board](https://matrix.org/blog/2023/12/electing-our-first-governing-board/#election-timeline)
as an Individual Member. I work on bridges[^1] and backend infrastructure[^2] as
a software engineer at [Beeper](https://www.beeper.com). You may have met me at
one of the Matrix meetups[^3] and possibly even seen me giving a presentation at
one of them. I have been a user of Matrix since around 2018[^4] and I have been
heavily involved in the community since around 2020[^5]. I've contributed
multiple spec clarifications[^6] and been involved in many MSCs both personally
and through my position at Beeper[^7]. I also have contributed to Synapse[^8]
and the Matrix React SDK[^9].

See also my
[endorsements of Ecosystem Member]({{<ref"./2024-matrix-governing-board-endorsements.md">}})
candidates.

> [!IMPORTANT] Conflict of Interest Disclosure
>
> I would like to make it clear that I'm running for this position of my own
> volition. **The opinions in this post are my own and do not represent the
> views of my employer Automattic nor that of Beeper.**
>
> Neither Automattic nor Beeper requested that I run, although I did request
> permission to do so from Brad (who is running as the Beeper representative).
>
> I am a member of the Matrix community first and an employee of Automattic
> (Beeper) second. I got my job through TWIM, and I want to see the Matrix
> ecosystem thrive. I'm concerned with the current direction of the ecosystem,
> and I want to do my part in turning the tide.
>
> I promise to always act in the interest of the community, and when I am unable
> to do so without a conflicting with my employer's interests I will abstain.

## My Platform

If elected, my primary goal as a member of the Governing Board would be to (1)
encourage a focus on chat and (2) increase ecosystem diversity. If Matrix does
not win at chat, we cannot win at anything, and if we do not have a diverse
ecosystem of implementations of the Matrix Spec, the benefits of openness cannot
be realized.

### 1. Focus on Chat

If Matrix doesn't become the backbone for interoperable chat, the damage that
siloed chat platforms do to personal privacy and data sovereignty will continue
to go unchecked. The foundation should be SOLELY investing in making Matrix into
the best platform for federated, interoperable chat. The Foundation should not
invest in speculative ideas such as VR/AR, P2P Matrix, low-bandwidth Matrix, IOT
Matrix, etc. until the chat ecosystem is healthy.

Diverting precious resources away from building a lasting ecosystem of chat apps
is suicidal for the project. If Matrix does not capture a large chat
market-share, all innovation towards future applications of Matrix are
pointless.

I believe that Element stretched themselves too thin which caused development to
stagnate, and I worry about the same future for the Foundation unless guardrails
are put in place. My platform is to focus on chat, and chat alone. **If we don't
win at chat, we can't win at anything.**

### 2. Ecosystem Diversity

The best way to create a healthy ecosystem is to have ecosystem diversity. We
need multiple complete implementations of the (meg)olm protocol for
cryptography[^10], multiple viable homeserver implementations, multiple
featureful clients, etc. Every new implementation stress-tests the Matrix spec,
and introduces new ideas into the ecosystem which benefits all of us.

## Specific Policies

Although it is still not entirely clear whether the Governing Board's
recommendations will be implemented, and what recommendations will even be
allowed, I will advocate for the following concrete policies in order to enact
the two pillars of my platform.

There will undoubtedly be a variety of issues that the Board discusses, but
these three specific policies will provide insight into my thoughts about the
Foundation's role in the ecosystem.

### No Covert Element Promotion

Element is a very important contributor to the Matrix Community. We should never
discount how important their work to bootstrap the ecosystem has been, and we
must recognize that their continued leadership is essential to the health of the
community. A healthy Element is essential to building a healthy Matrix
community.

Element's willingness to create and boostrap the Foundation attests to their
commitment to the community. However, if Element is serious about spinning off
the Foundation as an independent organization, they must also accept that they
are now one of many community members.

Foundation representatives have in the past emphasized Element-led experiments
such as Third Room, P2P Matrix, and low-bandwidth Matrix as core pillars of the
Matrix project. **They are not.** They are at best experimental projects led by
Element. The core of Matrix is the federated chat network that we all rely on
every day. That is what must be protected at all costs. **The Foundation must be
clear about which projects are Foundation initiatives, and which projects are
community initiatives.** I think that Element-led experiments should still be
highlighted, but they should be branded with Element's branding, not the
Foundation's.

Perception is reality, and right now a common (albeit incorrect) perception of
the Foundation is that it's merely a non-profit wing of Element and is a puppet
for Element's intentions. I am aware that this is not Element's intention and I
recognize the Governing Board as a step towards changing that perception, but
additional steps are necessary. Primarily, the Foundation must begin to be clear
about what entity is funding what initiatives.

This clarity will be a good thing for both the Foundation and Element. More
people will be willing to contribute to the Foundation if it has a focused
mission of fostering a diverse ecosystem of chat apps and is not distracted by
experiments. At the same time, it will be easier for the community to identify
and recognize Element's contributions to the ecosystem when it is clear which
entity is funding which projects.

When potential donors see experimental repositories in the `matrix-org` GitHub
organization and hear them emphasized at FOSDEM keynotes, the natural response
is scepticism. Natural questions include: Is the Foundation using my donations
to fund these speculative ideas? My notifications are still stuck, why are they
doing VR? I want custom emojis, whey are they trying to do P2P Matrix? These are
natural questions that community members have and could be alleviated by funding
and ownership clarity. I want Element to be able to promote the work they do as
they push the boundaries of Matrix. However, when discussing Element-funded
initiatives, using the Foundation's branding as a non-profit cloak is
unacceptable.

### Normalize Experimentation

The ability to experiment on top of Matrix is one of the strengths of the
protocol. These experiments should be the responsibility of the community. Not
everything has to be an MSC before experimentation begins. Community members
should be empowered to experiment first and prove out the idea before writing an
MSC.

There is no reason for us to MSC experimental projects before the basics have
been proven out. For one, it slows down development of such projects because
they get bogged down in the bikeshedding that comes with the MSC process while
still in the experimentation phase. Projects should feel free to work on
non-MSC'd experiments and if the experiment demonstrates viability, then the
projects can begin contributing their ideas via MSCs.

**The Foundation's role in this should be to suggest areas where experimentation
is necessary.** Right now, the biggest needs are improved sync, better
moderation primitives, and chat feature parity. The Foundation should not fund
these initiatives (nor host them in the `matrix-org` GitHub organization), but
rather use its trusted position within the community to encourage a diverse set
of ideas in these spaces, and use its influence to encourage the SCT to focus
their time on reviewing these important initiatives.

### Clean Up the `matrix-org` GitHub Organization

A project's presence in the `matrix-org` GitHub organization is mainly
determined by whether the project was started by an Element employee. For those
who are not as familiar with the way that the Foundation and Element are
related, it may even seem that these projects are Foundation-funded projects.
However, most of the projects are Element experiments that have been donated to
the Foundation and can (as we saw with Synapse) be un-donated.

Every project within the `matrix-org` GitHub organization should represent an
endorsement by the Foundation and come with a promise that the project will be
maintained regardless of what companies exist in the Matrix community.
Currently, this is obviously not the case as there are many dead/inactive
projects within the organization.

The `matrix-org` GitHub organization is full of projects which Element donated
to the Foundation and that the Foundation accepted as donations. No other entity
has been allowed to donate projects in a similar fashion. (Whether other
projects wanted to donate their projects to the Foundation is another question.
I have a feeling that there are probably some other projects that would like to
be donated but did not know that was an option.) Thus, **the Foundation should
un-donate many of the projects under its organization and establish a set of
_neutral_ requirements for projects to be included in the `matrix-org` GitHub
organization.** The primary requirement being that decision making within the
project is sufficiently distributed within the community (for example, across
multiple companies). Note that _neutral requirements_ are very important here.
From the perspective of the Foundation, Element is a third party, and all
project donations from Element should have the same vetting process as project
donations from any other third-party organization.

The obvious projects that need to stay under the `matrix-org` organization are
the [Matrix Spec](https://github.com/matrix-org/matrix-spec) and
[Matrix Spec Proposals](https://github.com/matrix-org/matrix-spec-proposals) as
those are the core of Matrix and are one of the primary places for where
collaboration within the Matrix community. Projects like the
[matrix.org](https://github.com/matrix-org/matrix.org) website and TWIM-related
projects are also important to the maintenance of the community and should be a
part of the `matrix-org` organization.

Some obvious projects that need to be un-donated and removed from the
`matrix-org` organization include all of the Third Room related projects, the
[React SDK](https://github.com/matrix-org/matrix-react-sdk) and many other old,
abandoned projects that litter the organization.

This split will benefit both Element and the Foundation as it will allow Element
to highlight their major contributions to the Matrix ecosystem inside their own
organization. The Foundation will also be able to provide value by focusing on a
narrow set of projects and promising to fund maintenance of them in perpetuity.
**It will be clear to donors that when they donate to the Foundation, they are
donating to the maintenance of those critical projects.**

If project discoverability is a concern, an `awesome-matrix` repository can be
established under the `matrix-org` organization and it should be populated with
as many projects as possible to highlight the ecosystem's diversity.

## Conclusion

I'm happy to see the Foundation taking steps to become an independent body as an
independent Foundation is essential to the longevity of the Matrix project as a
whole. I believe the policies I have laid out will materially improve both the
perception and reality of the Foundation as an independent body.

I'm glad that the Foundation is actively pursuing inclusion of more community
voices in the project. Element's willingness to create and boostrap the
Foundation speaks volumes of their commitment to the Matrix community. And while
this process will have its growing pains, we as a community must show a large
amount of grace towards Element and the Foundation during this transition and
always recognize Element's crucial contributions to the Matrix community.

I envision a world where the Foundation is entirely independent and maintains
the Spec and a few core projects while promoting a diverse ecosystem of chat
products built on Matrix. I envision a world where the Foundation is a
respected, independent thought leader within the Matrix community. I believe
this is the future we all want. I believe this the future we can have if we
clarify the Foundation's role within the ecosystem and empower it to fulfil that
role.

I care deeply about the Matrix community. I owe much of my career to the
community, and I believe that we have a once-in-a-generation opportunity to
define the future of chat. If you are eligible to vote as an Individual Member,
**I respectfully ask for your vote in the upcoming Governing Board election.**
Together, we can make a decentralized, interoperable, privacy-first future a
reality!

---

## Responses to Feedback About This Platform

I posted a link to this blog post on
[this week's TWIM](https://matrix.org/blog/2024/05/10/this-week-in-matrix-2024-05-10/)
and I'm thankful that it received a lot of attention and debate in the
[#thisweekinmatrix:matrix.org room](https://matrix.to/#/#thisweekinmatrix:matrix.org).

There are many messages that I feel a need to respond to in long-form, and I
will copy the text of the message and respond here. This part of the blog post
may be continually updated if additional messages that I feel like I need to
address come in.

### Matthew's Initial Response

Matthew first responded in
[this message](https://matrix.to/#/!QQpfJfZvqxbCfeDgCj:matrix.org/$5RxSXoE0P1_hWX5-2Y8BI7_oS0EMdgFmaCCNkIxxgUQ?via=matrix.org&via=envs.net&via=element.io)
to my blog post. This is the text of his message verbatim:

> fwiw, there are quite a few alarmingly incorrect assertions there:
>
> - Element as a company has no direct interest in thirdroom, p2p matrix, iot,
>   and other nextgen projects. We did that work as the Foundation, not as
>   Element (albeit majority funded by Element, like all our other core Matrix
>   work donated to the Foundation), hence putting it in the matrix.org github
>   repository to spell that out. The reason for doing it was to try to inspire
>   folks to build more than chat on Matrix, and seed Matrix (just as the core
>   team seeded synapse etc in the first place). Now, I completely agree that it
>   stretched the core team too thin and we should have focused on the core
>   platform, but all the posturing about this being “element experiments” is
>   completely wrong. moreover, Element stopped funding those projects almost a
>   year ago, so it feels particularly unfair to be railing against dead
>   projects. Fwiw, pure Element employees (ie those who don’t donate any of
>   their time to the fdn) generally considered them a distraction coming from
>   the Matrix project/fdn, rather than in any way directly beneficial to
>   Element (hence killing them :|)
> - There seems to be an assumption that the foundation funds or will fund core
>   protocol and chat work. Right now this is totally wrong. The Foundation
>   funds the stuff nobody else is funding (eg trust & safety, and publishing
>   the spec, and the costs of running matrix.org). It doesn’t pay for the SCT,
>   or crypto work, or security work, or matrix-{js,rust}-sdk work, or voip
>   work, or OIDC work, etc. And the majority of that is still picked up by the
>   core Matrix team at Element who donate their work to the Foundation. So
>   while the “foundation should spend all its money on chat!!” is laudable,
>   it’s not like the foundation spent a cent of its own $ on (say) thirdroom,
>   and it’s not like the foundation has the $ or technical org to build loads
>   of core protocol work (unless someone has $4M/y or so to donate!). So
>   instead the problem is for the GB to ensure that the foundation safeguards
>   the protocol and encourages it to be focused, regardless of who donates that
>   work, rather than trying to turn the foundation into a dev shop.
> - Finally, it’s super unclear to me what criteria should be used for donating
>   projects to github.com/matrix-org, given the expectation is then for the
>   core team to maintain them and vouch for them etc, which for a
>   security-focused project is critical. I’m not sure that we should become
>   freeform project hosting, or accept implementations from Jia Tan or whoever.
>   I’d rather than we reduce implementations managed by the Foundation, just as
>   W3C has. I’ll try to get a proposal together on paper for this before the GB
>   forms so we have a starting point for discussion.

To the first point, I have the following comments:

- If this is the case, then it's arguably worse than I initially thought: if the
  Foundation is actively encouraging other organizations to invest in nextgen
  projects and donate them to the Foundation it indicates to me that if the
  Foundation were well-funded, those projects would have been funded from the
  Foundation funds! I'm glad to see that there has been recognition that these
  projects were highly distracting for the Foundation. However, I worry what
  future ill-conceived projects a well-funded Foundation would invest in.

  Individual companies experimenting with different business models, products,
  etc. is essential to grow Matrix, however the Foundation must protect what is
  proven, and leave the innovation to the community (Element being a very big
  piece of said community).
- I think that the fact that it was unclear how these projects were being funded
  to me as a relatively involved community member, further supports my assertion
  that the Foundation must be clearer about its communications around which
  entities are pushing which initiatives and where the funding for said
  initiatives are coming from.

  If the communications from the Foundation around these projects was
  consistently along the lines of:

  > The Foundation believes that innovation in this space is essential to the
  > growth of Matrix. Element has stepped up to fund the development and
  > maintenance of PROJECT on the Foundation's behalf.

  it would have clarified that (a) the Foundation wanted the project to happen,
  and (b) that Element was donating their resources to developing said projects.
  Then, everyone could form their own opinions about whether the Foundation
  should be encouraging such projects or not.

To the second point, I have the following comments:

- I do not have any misconceptions about what the Foundation is funding. I
  apologize if my statements could be misconstrued in that manner, and if a
  specific statement could be pointed out that indicates a misunderstanding, I
  am willing to clarify my statements.
- I think that possibly the statement that is being referring to is:

  > Every project within the `matrix-org` GitHub organization should represent
  > an endorsement by the Foundation and come with a promise that the project
  > will be maintained regardless of what companies exist in the Matrix
  > community.

  Maybe this statement could be misunderstood as me thinking that this is the
  status quo, but I would like to draw the reader's attention to the key word
  "should" here. I understand that this is most definitely not the case with all
  of the projects in the organization at the moment. (This leads directly into
  my other policy of housecleaning of the GitHub org.)
- Until the Foundation is capable of guaranteeing funding for the development of
  a project, it should not be in the GitHub organization. The projects I
  mentioned (Spec, Spec Proposals, matrix.org website, and possibly some TWIM
  related projects) are the only ones that I know of which qualify under this
  rule. Of course, there may be more that I'm unaware of.

To the third point, I have the following comments:

- I agree that the `matrix-org` GitHub organization should not be a dumping
  ground for random projects, and I agree that there should be a very high bar
  for security in order for a project to be included. However, funding
  sustainability and general usefulness to multiple ecosystem stakeholders are
  the next most important criterion.
- Travis in a
  [message quickly after Matthew's](https://matrix.to/#/!QQpfJfZvqxbCfeDgCj:matrix.org/$EB6KJgFwYkm-LI3BEhcrxZsL78_d4yle2XcretO86WE?via=matrix.org&via=envs.net&via=element.io)
  said:

  > regarding the last point, that's something Josh and I have been working on
  > too alongside a few other people, fwiw. There's a pretty open question about
  > what it means for the Foundation to adopt a project even before what it
  > means from an expectations point of view.

  I support this effort and I hope that I will be able to contribute to this
  discussion via a seat on the Governing Board.

### Matthew's Follow-Up Regarding Separation of Element and Matrix

Matthew responded to his first messages with this
[second message](https://matrix.to/#/!QQpfJfZvqxbCfeDgCj:matrix.org/$WXN3bQhl3WZM-LkexI4E8rnl9SG0jxdbUysQhlnsI0g?via=matrix.org&via=envs.net&via=element.io)
(copied verbatim here):

> oh, and finally i’d caution against the “everyone thinks Matrix is just a
> non-profit wing of Element” rhetoric; your value of ‘everyone’ may he skewed
> to who you hang out with (and demeans all the successful work that has gone
> into separating the Foundation, including this election(!))

I believe that this was in reference to the following words in the original
version of this post:

> Perception is reality, and right now the perception of the Foundation is that
> it's merely a non-profit wing of Element and is a puppet for Element's
> intentions.

I acknowledge that my choice of words universalizes the statement and indicates
that everyone perceives the Foundation's relationship to Element in the way I
describe. I have updated the text to (emphasis added to show diff):

> Perception is reality, and right now _a common (albeit incorrect)_ perception
> of the Foundation is that it's merely a non-profit wing of Element and is a
> puppet for Element's intentions.

I believe that this more accurately reflects what I was attempting to
communicate.

I would like to address the assertion that my statements demean the work done in
separating the Foundation from Element. This is not my intention at all! If a
specific statement could be pointed out which demeans the efforts by Element to
separate the Foundation I will immediately redact or clarify that statement.

In fact, I believe that taken in its entirety, this platform is very supportive
and complimentary of Element's efforts to create an independent Foundation. I
would like to call attention to rest of the paragraph discussed above
(de-universalized version pasted below):

> Perception is reality, and right now a common (albeit incorrect) perception of
> the Foundation is that it's merely a non-profit wing of Element and is a
> puppet for Element's intentions. I am aware that this is not Element's
> intention and I recognize the Governing Board as a step towards changing that
> perception, but additional steps are necessary. Primarily, the Foundation must
> begin to be clear about what entity is funding what initiatives.

Specifically, in the second sentence, I laud the Governing Board (and implicitly
the election process for it) as a great step forward towards changing these
incorrect perceptions. Throughout this blog post, I also suggest multiple
specific policies that, if implemented, would materially reduce the probability
that this incorrect perception continues.

I would also like to call attention to this sentence two paragraphs above the
"Perception is reality" paragraph:

> Element's willingness to create and boostrap the Foundation attests to their
> commitment to the community.

and in the conclusion:

> Element's willingness to create and boostrap the Foundation speaks volumes of
> their commitment to the Matrix community. And while this process will have its
> growing pains, we as a community must show a large amount of grace towards
> Element and the Foundation during this transition and always recognize
> Element's crucial contributions to the Matrix community.

I will reiterate and go even further here: Element's willingness to create,
bootstrap, and be the primary funders of a Foundation which might sometimes be
at odds with Element's own interests is an incredible display of commitment to
the Matrix community. This commitment comes from the highest levels of
leadership of Element, and I specifically commend Matthew for his contributions
to creating an independent Foundation.

### On Calling The `matrix-org` GitHub Organization a "dumping ground for Element projects"

In
[this message](https://matrix.to/#/!QQpfJfZvqxbCfeDgCj:matrix.org/$Ko1pNrPINtJmqI6JradZNlb95DStB19nWUv6_OsSyjg?via=matrix.org&via=envs.net&via=element.io),
Matthew responded to this sentence from my original post:

> The `matrix-org` GitHub organization is a dumping ground for Element projects
> and there is not a clear pathway for any other entities to get their projects
> added to the organization.

Matthew's response was:

> basically, this is false and really worries me that folks are pushing a
> narrative that “stuff i don’t like is clearly Element being crap”, rather than
> assuming positive intent and appreciating that these projects were absolutely
> deliberately written for the Fdn and core project, not Element. As misguided
> as that might have been.

I acknowledge that my wording of the entire paragraph was subpar. In addition, I
was under the incorrect assumption that some of the projects were purely Element
ventures that were not explicitly considered donations to the Foundation which I
believe contributes to the controversy around this paragraph. In order to
explain what I was trying to communicate, let me provide the entire paragraph
that appeared in the original version of this post:

> The `matrix-org` GitHub organization is a dumping ground for Element projects
> and there is not a clear pathway for any other entities to get their projects
> added to the organization. Thus, **the Foundation should un-donate many of the
> projects under its organization and establish a set of requirements for
> projects to be included in the `matrix-org` GitHub organization.** The primary
> requirement being that decision making within the project is sufficiently
> distributed within the community (for example, across multiple companies).

My intent with the original statement was to:

1. Call out that that Element was the only entity that was allowed to donate
   projects to the `matrix-org` GitHub organization, despite many other projects
   from the community reaching equivalent muster to the Element-donated
   projects. (Whether other projects wanted to donate their projects to the
   Foundation is another question. I have a feeling that there are probably some
   other projects that would like to be donated but did not know that was an
   option.)
2. Assert that many of the project donations should not have been accepted by
   the Foundation (and that the Foundation must retroactively rectify this).
3. Propose that a set of neutral requirements should be established for projects
   wishing to be donated into the Foundation.

   I would like to point out that _neutral requirements_ are very important
   here. From the perspective of the Foundation, Element is a third party, and
   all project donations from Element should have the same vetting process as
   project donations from any other third-party organization.

I acknowledge that this was likely not what most people got from my original
wording, and so I have updated it (new text below):

> The `matrix-org` GitHub organization is full of projects which Element donated
> to the Foundation and that the Foundation accepted as donations. No other
> entity has been allowed to donate projects in a similar fashion. (Whether
> other projects wanted to donate their projects to the Foundation is another
> question. I have a feeling that there are probably some other projects that
> would like to be donated but did not know that was an option.) Thus, **the
> Foundation should un-donate many of the projects under its organization and
> establish a set of _neutral_ requirements for projects to be included in the
> `matrix-org` GitHub organization.** The primary requirement being that
> decision making within the project is sufficiently distributed within the
> community (for example, across multiple companies). Note that _neutral
> requirements_ are very important here. From the perspective of the Foundation,
> Element is a third party, and all project donations from Element should have
> the same vetting process as project donations from any other third-party
> organization.

### Matthew's Reply to Clarifications

After I made the above edits to this post, Matthew responded in the TWIM room
with
[this message](https://matrix.to/#/!QQpfJfZvqxbCfeDgCj:matrix.org/$UbnrX9btMs3N4Vyq7RHBKFjSuy5tYJTUIQRviL85wf8?via=matrix.org&via=envs.net&via=element.io):

> having read it through again, i think the key confusion stems from the fact
> that Element is nowadays viewed through the same lens as any other forprofit
> building on Matrix (like Beeper, say).
>
> Whereas Matrix predated Element by 3 years, and the Matrix core team (ie those
> looking after the contents of github.com/matrix-org) simply kept building
> projects which we thought would strategically advance Matrix the most. First
> we did synapse, then matrix console, then js-sdk, then ios-sdk, then
> android-sdk, then react-sdk (but very deliberately kept the app later of
> vector/riot/element for Element IP), and then later put out similar new
> “matrix core team continuing to try to advance matrix” stuff, be that sliding
> sync or MAS or dendrite or LB or thirdroom or whatever.
>
> It’s not so much that “Element chose to donate these to the Fdn and forced the
> Fdn to accept them” as much as “The Fdn didn’t exist yet; the Matrix core team
> just kept doing what they had been doing since day 1; the fact their dayjob is
> at Element is unrelated” (other than Element funding n% of their time to keep
> going wild on core Matrix stuff). So characterising these as unilateral
> donations from Element misses the point that there is a team of people with
> commit access to matrix-org trying (for better or worse) to advance the
> project, irrespective of who they work for. Critically: If Element hadn’t
> existed, the core team would have probably found a way to continue on similar
> things in github.com/matrix-org (working on it in their spare time or by other
> employers letting them work on it).
>
> Now, the GB is a great opportunity to steer what happens in
> github.com/matrix-org and who and why, and hopefully fix confusion like this
> in future. But please do not paint over the existence of the folks who created
> Matrix (independently of whatever employer they have) and the last 10 years
> we’ve spent trying to bring this thing successfully to life. While it’s
> certainly not been perfect, we’re still literally core to the project, and the
> opportunity of the GB is to figure out how to steer that better in future.

and outlined his view on what the Core Team is in
[this Google Doc](https://docs.google.com/document/d/1zMMSjUD2JUFl4jlc6QJfgNMkz-iyBwKvITLmVpJ2zyw/edit).

First of all, I want to make it clear that I respect and recognize the
contributions of every community member (individuals, businesses, etc.) to the
Matrix ecosystem, even those projects which I believe were ill-conceived ideas!
Everyone is experimenting, and sometimes the outcome of an experiment is
understanding that the hypothesis is false, and those contributions are just as
important as experiments that succeed.

I know that this community is a passionate one. I believe that even if Element
were not paying the salaries of the vast majority of the Core Team members,
there would still be a set of people donating their time to the Matrix project.
However, in such a world, would every experiment by every Core Team member be
added directly to the organization? I think not. I know in the NixOS community,
there is both the [NixOS organization](https://github.com/NixOS/) and the
[Nix Community organization](https://github.com/nix-community/). I think that
Matrix might have looked similar. I think that the idea proposed in the Google
Document of a Matrix Labs organization (or similar) would be a reasonable way
forward.

I would like to call out this specific bullet-point from the document:

> Development costs of projects in github.com/matrix-org do NOT have to be
> funded by the Matrix.org Foundation; they can be contributed by whoever is
> developing them. However, the Foundation must agree for the project to exist
> there.

This brings up three major questions. I do not know the current answer to these
questions, but I will propose what I believe the answers _should_ be:

1. **What is the mandate of the Core Team?**

   I believe that the Core Team's mandate should not be one of experimentation
   and pushing the boundaries. It should be a mandate to maintain and protect
   the proven projects that are essential to the success of Matrix as a whole.

1. **If the Foundation were in a position to fund the entire Core Team, would
   it?**

   I think that if the Foundation were able to, it should fund Core Team members
   in areas where companies/individuals are not donating sufficient time to
   maintain the essential projects.

1. **Who gets to be on the Core Team?**

   Regardless of the answer to this question, I think the most important factors
   must be that membership requirements are neutral and stringent (for security
   reasons).

Assuming that my answers are correct, and the `matrix-org` GitHub organization
is meant to hold the set of projects maintained by the Core Team, then I believe
my policy of GitHub organization cleanup is well justified.

By trimming down the GitHub organization to the set of projects which the
Foundation can reasonably expect to be able to maintain funding for (whether
directly or indirectly), it will clarify the Foundation's priorities. I hope
that in a disaster situation where every company working on Matrix goes bankrupt
overnight, the Foundation would step up to ensure the continuity of a few core
projects (I outlined four of them in my original post).

As I highlight in my second specific policy of
[normalizing experimentation](#normalize-experimentation), the Foundation has a
vested interest in encouraging experimentation and innovation. I think that it
could even be an IP repository for a variety of experiments. However, these
should not go into the Core Team's organization. Matthew's suggestion of a
`matrix-labs` organization seems like a good solution here.

I'm happy to see that my discussion of these issues is prompting consideration
from leadership. I commend Matthew once again for his willingness to listen to
feedback, clarify misconceptions, and propose changes to materially improve the
situation. I hope to be elected to the Governing Board to continue this already
very fruitful conversation.

[^1]: Notable bridges I've worked on include
[LinkedIn](https://github.com/beeper/linkedin),
[iMessage](https://github.com/mautrix/imessage), and
[WhatsApp](https://github.com/mautrix/whatsapp); and I've contributed to the
rest of the [mautrix](https://github.com/mautrix) bridges and the
[Go](https://github.com/mautrix/go) and
[Python](https://github.com/mautrix/python) SDKs.

[^2]: Notably, I started the
[hungryserv](https://github.com/sumnerevans/hungryserv-presentation) project.
I've also built a few Matrix bots including
[chatwoot](https://github.com/beeper/chatwoot) and
[standupbot](https://github.com/beeper/standupbot).

[^3]: I went to the [first Berlin Matrix Community Summit]({{< ref
"../travel/2022-berlin-matrix-summit/summit" >}}) and FOSDEM in both [2023]({{<
ref "../travel/2023-fosdem/fosdem" >}}) and [2024]({{< ref
"../travel/2024-fosdem/fosdem" >}}).

[^4]: I started using Matrix around 2018 when I was the president of my
university's computer science club (ACM). I was looking for an open source chat
app to use for our club's communications. I didn't start to really work on
Matrix projects until 2020, but my first project was a small Matrix bot which I
think was a contributing factor to me being hired by Beeper.

[^5]: Notably, I was heavily involved in the NixOS switch from IRC to Matrix
when freenode had all of their issues a few years ago. I answered questions in
the general chats, and helped familiarize the community moderators with the
Mjolnir project.

[^6]: I clarified how SAS works in
[#1719](https://github.com/matrix-org/matrix-spec/pull/1719) and
[#1720](https://github.com/matrix-org/matrix-spec/pull/1720) and I clarified
that there was a bug in libolm which caused the
`m.megolm_backup.v1.curve25519-aes-sha2` key backup algorithm to be implemented
incorrectly in [#1712](https://github.com/matrix-org/matrix-spec/pull/1712). I
also clarified a detail of the `/context` endpoint in
[#1239](https://github.com/matrix-org/matrix-spec/pull/1239).

[^7]: I authored
[MSC4027: Propose method of specifying custom images in reactions](https://github.com/matrix-org/matrix-spec-proposals/pull/4027)
and I contributed to
[MSC2246: Asynchronous media uploads](https://github.com/matrix-org/matrix-spec-proposals/pull/2246)
by [Tulir](https://github.com/tulir) and
[MSC3860: Media Download Redirects](https://github.com/matrix-org/matrix-spec-proposals/pull/3860)
by [Nick Mills-Barrett](https://github.com/Fizzadar).

[^8]: I implemented
[Asynchronous Uploads](https://github.com/matrix-org/synapse/pull/15503) which
necessitated a
[fix to the `LockStore`](https://github.com/matrix-org/synapse/pull/12832) which
was previously not correctly linearized. I've also contributed to improving the
documentation in [#11221](https://github.com/matrix-org/synapse/pull/11221),
[#13228](https://github.com/matrix-org/synapse/pull/13228), and
[#15852](https://github.com/matrix-org/synapse/pull/15852).

[^9]: I implemented
[rendering custom images in reactions](https://github.com/matrix-org/matrix-react-sdk/pull/11087)
for [MSC4027](https://github.com/matrix-org/matrix-spec-proposals/pull/4027) and
fixed a bug where
[notifications were disabled while Element was
focused](https://github.com/matrix-org/matrix-react-sdk/pull/8590).

[^10]: DerLukas has started [goolm](https://codeberg.org/DerLukas/goolm) which
we integrated into [mautrix-go](https://github.com/mautrix/go) as an
experimental option. I want to see more of this in the future.
