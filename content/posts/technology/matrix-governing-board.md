---
title: My Matrix Governing Board Platform
date: 2024-04-24T03:25:00-06:00
categories:
  - Technology
tags:
  - Matrix
  - Matrix Governing Board
description: |
  I'm running for the Matrix Governing Board as an Individual Member. My
  platform is to encourage a focus on chat by increasing ecosystem diversity.
---

I'm
[running for the Matrix Governing Board](https://matrix.org/blog/2023/12/electing-our-first-governing-board/#election-timeline)
as an Individual Member. I work on bridges[^1] and backend infrastructure[^2] as
a software engineer at [Beeper](https://www.beeper.com). You may have met me at
one of the Matrix meetups[^3] and possibly even seen me giving a presentation at
one of them. I've contributed multiple spec clarifications[^4] and been involved
in many MSCs both personally and through my position at Beeper[^5].

If elected, my primary goal as a member of the Governing Board would be to
encourage a focus on chat and increase ecosystem diversity.

**FOCUS ON CHAT:** If Matrix doesn't become the backbone for interoperable chat,
the damage that siloed chat platforms do to personal privacy and data
sovereignty will continue to go unchecked. The foundation should be SOLELY
investing in making Matrix into the best platform for federated, interoperable
chat. The Foundation should not invest in speculative ideas such as VR/AR, P2P
Matrix, low-bandwidth Matrix, IOT Matrix, etc. until the chat ecosystem is
healthy.

**ECOSYSTEM DIVERSITY:** The best way to create a healthy ecosystem is to have
ecosystem diversity. We need multiple complete implementations of the (meg)olm
protocol for cryptography[^6], multiple viable homeserver implementations,
multiple featureful clients, etc. Every new implementation stress-tests the
Matrix spec, and introduces new ideas into the ecosystem which benefits all of
us.

I am a member of the Matrix community first and an employee of Beeper second. I
got my job through TWIM, and I want to see the Matrix ecosystem thrive. I'm
concerned with the current direction of the ecosystem, and I want to do my part
in turning the tide.

[^1]: Notable bridges I've worked on include
[LinkedIn](https://github.com/beeper/linkedin),
[iMessage](https://github.com/mautrix/imessage), and
[WhatsApp](https://github.com/mautrix/whatsapp); and I've contributed to the
[Go](https://github.com/mautrix/go) and
[Python](https://github.com/mautrix/python) SDKs.

[^2]: Notably, I started the
[hungryserv](https://github.com/sumnerevans/hungryserv-presentation) project.

[^3]: I went to the [first Berlin Matrix Community Summit]({{< ref
"../travel/2022-berlin-matrix-summit/summit" >}}) and FOSDEM in both [2023]({{<
ref "../travel/2023-fosdem/fosdem" >}}) and [2024]({{< ref
"../travel/2024-fosdem/fosdem" >}}).

[^4]: I clarified how SAS works in
[#1719](https://github.com/matrix-org/matrix-spec/pull/1719) and
[#1720](https://github.com/matrix-org/matrix-spec/pull/1720) and I clarified
that there was a bug in libolm which caused the
`m.megolm_backup.v1.curve25519-aes-sha2` key backup algorithm to be implemented
incorrectly in [#1712](https://github.com/matrix-org/matrix-spec/pull/1712). I
also clarified a detail of the `/context` endpoint in
[#1239](https://github.com/matrix-org/matrix-spec/pull/1239).

[^5]: I authored
[MSC4027: Propose method of specifying custom images in reactions](https://github.com/matrix-org/matrix-spec-proposals/pull/4027)
and I contributed to
[MSC2246: Asynchronous media uploads](https://github.com/matrix-org/matrix-spec-proposals/pull/2246)
by [Tulir](https://github.com/tulir) and
[MSC3860: Media Download Redirects](https://github.com/matrix-org/matrix-spec-proposals/pull/3860)
by [Nick Mills-Barrett](https://github.com/Fizzadar).

[^6]: DerLukas has started [goolm](https://codeberg.org/DerLukas/goolm) which we
integrated into [mautrix-go](https://github.com/mautrix/go) as an experimental
option. I want to see more of this n the future.
