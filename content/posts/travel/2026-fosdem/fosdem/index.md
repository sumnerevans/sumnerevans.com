---
title: FOSDEM 2026
date: 2026-01-31T06:25:00-06:00
categories:
  - Travel
tags:
  - FOSDEM
  - Matrix
  - HSBXL
  - Go (Programming Language)
  - Brussels
  - Belgium
description: |
  I attend FOSDEM 2026 and catch up with former Beeper coworkers, my friend Sam,
  and a bunch of Matrix-adjacent people.
---

The purpose of this trip was (ostensibly) to attend the FOSDEM 2026 conference.
Since I'm no longer
[working at Beeper]({{<ref"../../../life-updates/joining-canam/index.md">}}),
there is not really any work-related reason for me to attend the conference. But
I wanted to do it to give myself an excuse to go to Europe, and as an
opportunity to catch up with former Beeper coworkers, and meet up with a few
other friends as well.

I departed Prague Friday morning on the earliest flight. The flight was an
uneventful and I slept through most of it. I've flown into Brussels Airport
Zaventem many times at this point. It's probably the European airport that I
have the most experience with at this point. I'm at the point where I have
navigated it enough that it feels familiar. (It's crazy when you start to know
where things are at foreign airports.) Overall, I think the airport is pretty
good, but the best part is how well connected it is to the train system.

Once I arrived in Brussels, I headed straight for [HSBXL](https://hsbxl.be/) (an
open source hackerspace in Brussels) where there was a
[Matrix hackathon](https://matrix.org/blog/2025/12/fosdem-presence/#friday-30th-january-community-hackathon-lounge-evening).
Things were just starting to get going. Projects were being proposed, and people
were discussing what they were going to work on during the hackathon. I ended up
working with [Henry](https://henryhiles.com/) on the
[Nexus](https://git.federated.nexus/henry-hiles/nexus) client which is a Matrix
client that uses Flutter with the [Gomuks](https://github.com/gomuks/gomuks) FFI
SDK. I have a bit of experience with Gomuks, so I was able to help out a bit.
Honestly, though, I was not very useful. I helped work through like one issue,
but Henry did all of the actual work.

Instead, I spent most of the time configuring Niri and catching up with
[Sam](https://samsartor.com/) and [Addison](https://tgrcode.com/) who had also
made the trip to FOSDEM from the states. Towards the end of the morning,
[Tulir](https://mau.fi/) arrived and was actually helpful to Henry, since he
actually built the FFI SDK. It was pretty cool to see how well the SDK worked
for developing the Nexus client.

After the hackathon was over and people who actually did things shared what they
had worked on, Addison and I headed to our hotel to get checked in and then we
went to dinner. We went to a burger place that was kinda mid. I was quite tired
considering I'd been travelling since early morning, so I turned in for the
evening.

---

On Saturday, I met Sam for a late breakfast at a cafe located halfway between my
hotel and Université Libre de Bruxelles (ULB) where FOSDEM is hosted. It was
nice to catch up and hear how he is doing. He is moving to London soon to work
at Adobe, so I think I'll have excuses to make a trip to the UK every once in a
while.

Once we got to ULB, the most interesting talks looked like the ones going on in
the
[Browser and web platform](https://fosdem.org/2026/schedule/track/browser-and-web-platform/)
track.

The first talk I attended was about
[MathML Core](https://www.w3.org/TR/mathml-core/) which is a cool way to encode
mathematical typesetting in HTML. I have used MathJax in the past for this, but
MathML appears to be something I could use for many cases going forward. I'll
have to try it out sometime.

The next talk was about WebViews (the embedded browsers that pop up in-app on
mobile apps). I didn't realise that the WebViews are entirely separate from the
browsers you have installed on your device. This naturally causes fragmentation
and confusion because the features are also often different between WebViews and
the mobile browser.

The last talk I listened to in that devroom was about WebTransport. It's a more
modern protocol than WebSocket, and provides things like the ability to have
unreliable delivery of packets which is useful for things like streaming where
dropping packets instead of attempting to resend is actually the preferable
behaviour. It seems like it's basically a lower-level version of WebSockets, and
is built to take advantage of HTTP/3. I don't really have any use for it at this
point, but it's nice to learn about the new technology.

At that point, I went over to the big auditorium for a talk about a Git workflow
the speaker refers to as "Atomic Flow". The core of the flow is that each commit
should "atomic". You should be able to checkout any commit, and everything
should build. All commits should be easily revertable, and you should have a
linear history. I'm a big fan of AtomicFlow, and I have used a lot of the
principles of that flow in my projects. I wonder if there is anything that I can
learn and apply to the Git processes that we use at Can/Am.

After that talk, it was stack time so I went to get a Belgian waffle from the
food truck and then went over to the Matrix stand to catch up with people. I had
a nice conversation with
[Neil](https://www.linkedin.com/in/neil-johnson-717baa6/) and caught up with
[Kim](https://github.com/harharlinks). I also caught up with Tulir and Tobias
about how things were going at Beeper.

Then I went back the browser devroom for another couple talks. The one that I
found the most interesting was one about the WASM garbage collector, but by that
time my brain was fried so I decided that acquiring nutrition would be the next
order of business. Addison and I found an Indian restaurant that was pretty
decent, and then I headed to bed.

---

On Sunday, I had a slightly late start, but I managed to get to the Go dev room
for the talks I really cared about. The first talk was about the new Green Tea
garbage collector in Go 1.26. The new GC is optimized for modern processor
caches and takes advantage of vector operations. I didn't quite understand what
was going on, but I'm always interested in how people are taking advantage of
new processor features.

The next talk was about Go's reflection. It talked about how type information
works, and it honestly felt pretty obvious. It was kinda nice to know that Go's
reflection does more or less what you would expect it to.

By this point, it was lunchtime so I went and got some noodles from one of the
food trucks and then went to the Matrix devroom for
[Hubert Chathi](https://www.uhoreg.ca/)'s talk about DMLS. Messaging Layer
Security (MLS) is an IETF standard for end-to-end encryption in messaging
systems, but relies on a central server. Hubert talked about two approaches for
making it work in a distributed manner. Both of them are (not very) conveniently
named DMLS (Distributed MLS and Decentralised MLS). One of them uses this thing
called a Puncturable Pseudo-random Functions which sound cool and scary at the
same time. It's seems like a very active field of cryptography research. It
definitely sound like there is not going to be any movement towards using MLS in
Matrix any time soon, since there are so many foundational problems to resolve
before then.

That was pretty much the trip. I enjoyed catching up with friends at FOSDEM, and
it was nice to see Sam (despite living in the same state, we seem to only see
each other when we travel overseas to the same conference). I am not sure if I
will attend FOSDEM next year (it's not the best time of the year to travel to
Europe) but I have enjoyed making the trip the last few years. It has been
especially nice getting to know members the Matrix community through events like
this.
