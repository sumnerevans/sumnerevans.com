---
title: FOSDEM 2024
date: 2024-02-05T06:25:00-06:00
categories:
  - Travel
  - Trip to FOSDEM 2024
tags:
  - Travel
  - FOSDEM
  - Matrix
  - HSBXL
  - Go
  - Brussels
description: |
  For the second year in a row, I attended FOSDEM. I attended the Matrix
  community meetup as well as many talks at the main conference.
draft: true
---

The primary purpose of my trip was to attend FOSDEM, a Free and Open Source
Software conference. I [attended last year as well]({{< ref
"../../2023-fosdem/fosdem/" >}}>) and enjoyed it, so I decided to make the trip
to attend again. FOSDEM is the biggest meeting of people in the Matrix community
every year, and there is also a sizeable Go presence at the conference as well.

At Beeper, I primarily write Go, and I work extensively on Matrix bridges as
well as other Matrix-related projects such as bots and homeservers. I am fortune
that the technology that I work on at my job also heavily intersect with the
technologies that I'm interested in, so FOSDEM lines up perfectly with my
personal and work interests.

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
[Christian](https://chrpaul.de/) Jan, and many others.

A bunch of people trickled in to the event throughout the afternoon and evening,
including my coworker [Tulir](TODO).

I'm happy to see that so many people are building on top of Matrix. I believe
that the strength of the Matrix project comes from its community, and it's at
meetups like this where the power of the community is truly demonstrated.

---

On Saturday, I spent most of my time in the Go devroom. The first talk I
attended was _The Secret Life of a Goroutine_ by Jes[u con accento TODO]s Espino
who discussed the goroutine lifecycle and the basics of how the scheduler
allocates tasks across all of the OS threads and processors on the CPU. It was a
really fantastic talk and had some fun illustrations for explaining the
goroutine lifecycle.

The next talk was by Jonathan Hall who discussed the process of becoming a Go
contributor. He described his experience going through the process from proposal
to getting a change landed in the language.

I then took a short break to go over to the Matrix stand and say hello to the
people hanging out around it. I ran into Tulir and we ended up heading back to
the Go devroom for more interesting talks.

The next talk was about differential fuzzing, a technique for determining if a
rewritten function matches the functionality of the previous function. Fuzzing
is a means to produce a bunch of random inputs to try find edge cases which you
haven't explicitly tested for. The issue with fuzzing is that often you do not
know what the correct answer should be given some random input. There are a few
ways to deal with this. If the operation has an inverse (marshal and unmarshal
for example), performing the full round-trip and ensuring that the random
fuzzing input is preserved is a good way to test the functionality. However,
sometimes you don't have such a luxury. In these cases, you can use known-good
implementations as a reference and ensure that the old and new implementations
agree on the output. Tulir mentioned that it might be a good way to test the
functionality of goolm, a pure Go implementation of Olm and Megolm which was
contributed to mautrix-go by TODO.
It was a very good talk, and Maciej Mionskowski

- Go devroom
  - differential fuzzing
  - secret life of a goroutine
  - dependency injection
  - goreleaser
  - free software maintainer as a profession
- Matrix stand
- Sunday:
  - Matrix keynote
  - NixOS devroom
    - Automatic boot assessment
    - typhon CI
  - Post-Quantum Cryptography
- Matrix Room
  - Travis Talk interoperability
    - Protocol Converter instead of bridge which maintains encryption

Friday wake up late Friday lunch at Mr Wei Friday dinner at community summit

Saturday breakfast from little store Saturday lunch at noodle stand Saturday
waffles Saturday dinner vietnamese Pacifique Restaurant

Sunday breakfast from little store Sunday lunch hot dog from stand Sunday dinner
at Chinese
