---
title: FOSDEM 2024
date: 2024-02-05T06:25:00-06:00
categories:
  - Travel
  - Conferences
tags:
  - FOSDEM 2024
  - Matrix
  - HSBXL
  - Go
  - Nix
  - NixOS
  - Brussels
  - Belgium
description: |
  For the second year in a row, I attended FOSDEM. I attended the Matrix
  community meetup as well as many talks at the main conference.
image: images/matrix.jpg
---

The primary purpose of my trip was to attend FOSDEM, a Free and Open Source
Software conference. I [attended last year as well]({{< ref
"../../2023-fosdem/fosdem/index.md" >}}) and enjoyed it, so I decided to make
the trip to attend again. FOSDEM is the biggest meeting of people in the Matrix
community every year, and there is also a sizeable Go presence at the conference
as well.

At Beeper, I primarily write Go, and I work extensively on Matrix bridges as
well as other Matrix-related projects such as bots and homeservers. I am fortune
that the technology that I work on at my job also heavily intersect with the
technologies that I'm interested in, so FOSDEM lines up perfectly with my
personal and work interests.

## Matrix Community Meetup

On the Friday before FOSDEM, the Matrix community once again hosted a community
meetup at HSBXL. Probably north of seventy-five people were in attendance
including many prominent members of the community. I was able to see many of the
people who I'd met at previous Matrix events and I also met quite a few new
people as well. [Yan](https://www.linkedin.com/in/yncyrydybyl/) and
[Kim](https://github.com/harharlinks) once again did a fantastic job organizing
the meetup as a barcamp with an ad-hoc schedule based on the interests of the
people in attendance.

I slept in on Friday until just before noon, so I ended up arriving to the
meetup late at around 13h after having a nice sushi lunch. Of the people who I
met for the first time, I especially enjoyed talking to
[Travis Ralston](https://github.com/travisr) who is a spec core team member and
[Will Hunt (half-shot)](https://github.com/half-shot) who works on bridges at
Element. I also enjoyed speaking to Kevin, who was at the meetup representing
Fastly and was interested in seeing what they might be able to do to provide a
CDN in front of Matrix media. I also enjoyed reconnecting with many people who
I'd interacted with at previous events including
[Ben](https://www.linkedin.com/in/benparsons/),
[Marcel](https://github.com/mtrnord), [Nico](https://neko.dev/),
[Christian](https://chrpaul.de/), Jan, and many others.

A bunch of people trickled in to the event throughout the afternoon and evening,
including my coworker [Tulir](https://mau.fi/). Eventually, pizza came,
sponsored by [Nordeck](https://nordeck.net/) and
[Famedly](https://www.famedly.com/), and great conversations continued
throughout the evening.

I'm happy to see that so many people are building on top of Matrix. I believe
that the strength of the Matrix project comes from its community, and it's at
meetups like this where the power of the community is truly demonstrated.

## Go Devroom

On Saturday, I spent most of my time in the Go devroom. I'll describe the talks
that I found to be most interesting.

The first talk I attended was _The Secret Life of a Goroutine_ by Jesús Espino
who discussed the goroutine lifecycle and the basics of how the scheduler
allocates tasks across all of the OS threads and processors on the CPU. It was a
really fantastic talk and had some fun illustrations for explaining the
goroutine lifecycle.

{{<figure
  src="images/go-devroom.jpg"
  title="Jesús Espino being introduced for his talk in the Go devroom"
  caption="As you can see from just the first slide, it was a very visually appealing presentation."
>}}

Another talk that I enjoyed was by Jonathan Hall who discussed the process of
becoming a Go contributor. He described his experience going through the process
from proposal to getting a change landed in the language. It was interesting to
hear about the processes that drive the Go language.

Probably my favourite talk overall was about _differential fuzzing_, a technique
for determining if a rewritten function matches the functionality of the
previous function. The speaker, Maciej Mionskowski, was clearly very
knowledgable and provided really great examples of how it can be used in
practice. Fuzzing is a testing tool in which you produce a bunch of random
inputs to try find edge cases which you haven't explicitly tested for. The issue
with fuzzing is that often you do not know what the correct answer should be
given some random input. There are a few ways to deal with this. If the
operation has an inverse (marshal and unmarshal for example), performing the
full round-trip and ensuring that the random fuzzing input is preserved is a
good way to test the functionality. However, sometimes you don't have such a
luxury. In these cases, you can use known-good implementations as a reference
and ensure that the old and new implementations agree on the output. Tulir
mentioned that it might be a good way to test the functionality of goolm, a pure
Go implementation of Olm and Megolm which was contributed to mautrix-go by
[@DerLukas15](https://github.com/DerLukas15). It was a very good talk, and
Maciej was very knowledgable with this technique as he had used it to find some
bugs in the Go HTML parsing library.

Another talk I enjoyed was by Filippo Valsorda who is working as a full-time
professional open source maintainer. His business model is to sell retainers to
companies interested in funding his work and having access to his expertise. I'd
heard him on a previous Go Time podcast, and it was cool to hear an update a
little over a year into his journey. I think that the thing that strikes me the
most is his emphasis on making it a true business-to-business transaction, so
that the funding can be done in terminology that legal and finance teams can
understand and handle easily. For example, instead of asking for donations via
some site like Patreon, he sends actual invoices to companies.

Later in the day Dylan Reimerick gave a talk about dependency injection, which
is a technique that I hear a lot about, but didn't really ever understand what
it meant until the talk. He mentioned that Go's interfaces allow for fairly
flexible dependency injection, as the dependant package can define an interface
that it expects and can then callers can have different implementations as long
as they implement the interface. He also provided some tips about defining
dependency injection boundaries (he recommended package-level for most cases)
and many other tips.

The last talk I attended was about GoReleaser, which is a tool which aims to
replace Makefiles in Go projects by automating building, cross-compiling,
dockerizing, among other tasks using a declarative YAML file. I'm going to have
to look into it for some of my side projects and see if it's any good.

When I wasn't at the Go devroom, I was spending time over at the Matrix stand in
the sponsor hall, or getting food at one of the food trucks in the plaza between
the university buildings.

Later in the evening, I met up with a bunch of Matrix folks at a Vietnamese
restaurant. I sat with Yan, Ben, and Tadeusz, and we enjoyed conversations about
Matrix, and also about sharing about the different cultures of the countries we
live in.

## Some Other Talks

On Sunday, I attended some talks about Matrix (see below), but I also spent some
time in the Nix devroom and attended a talk about post-quantum cryptography.

The talk that I thought was most interesting in the Nix devroom was one about
automatic boot assessment. Basically, it is a feature where if your latest
generation fails to boot a few times, then it will revert back to the previous
generation and boot from that instead. I think that I'll try employing that
technique on my servers as that will hopefully prevent me from ever having to
use the Hetzner console to change the boot target on my servers if I mess up a
generation.

I also went to a talk about post-quantum cryptography. I don't remember the
exact name of the devroom, but the speaker talked about post-quantum
cryptosystems and their challenges. One of the biggest difficulties is the fact
that the key sizes are so much larger in quantum-resistant cryptosystems.
Additionally, the systems require a hybrid approach (using both a
quantum-resistant and a classically-resistant algorithm together) which balloons
complexity.

## Focused on Matrix

On Sunday morning, Matthew gave a keynote about the state of Matrix on the
FOSDEM main stage. He provided an update on the Matrix Foundation and the
progress that the ecosystem has made over the past year.

{{<figure
  src="images/matrix.jpg"
  title="Matthew giving the Matrix keynote on the FOSDEM main stage"
>}}

He talked about the progress that the Matrix Foundation has made in helping
shape the implementation of the DMA. He discussed a potential architecture for
allowing interop to occur between gatekeeper clients (Facebook Messenger and
WhatsApp) and Matrix clients. It seems like the biggest challenge will be
agreeing on a standard message format. I have a feeling that the gatekeepers
will just publish their event format and require interoperating services to
implement whatever message format they say. This will necessitate having clients
interpret the gatekeeper message formats. This could be done with a message
format converter that takes the gatekeeper message format and converts it to
Matrix, but that will basically require bridge code to be embedded into the
client. Of course, ideally the gatekeepers would adopt a standard format such as
Matrix events, but I think that is unfortunately very unlikely. That being said,
I think that the Foundation's advocacy work with the DMA regulators is extremely
important, and any pressure they can apply to gatekeeper organisations is
beneficial to the entire ecosystem.

Matthew also discussed the things that the Foundation focused on in the last
year. Thankfully, they have stopped funding the many absurd projects such as
thirdroom, low-bandwidth Matrix, and P2P Matrix that were diverting valuable
Foundation resources away from promoting Matrix as a truly open, truly
decentralised, and truly privacy-first protocol that can become the industry
standard for interoperable communications. I'm excited about this new focus from
the Foundation.

In the afternoon, there was also a Matrix devroom. The talk I was most
interested in was by Travis Ralston about the technical aspects of the DMA
interop that Matthew had discussed during the keynote. I think that it will be
interesting to see how the DMA actually gets enforced and how the gatekeepers
will implement interop.

---

In all, I enjoyed my time at FOSDEM, and I learned a lot about a variety of
topics. I also was able to meet new people and interact with people I'd already
met at previous events. The Matrix project's strength is its community which
consists of a great group of people who are building a myriad of applications
under a diverse set of requirements across many industries. As long as the
Matrix community is strong, the project will be strong. Right now, the community
is strong, but we must keep focused on the goal of an interoperable,
decentralised, open, privacy-first chat ecosystem. I'm excited to see what
progress we make towards this goal in the next year!
