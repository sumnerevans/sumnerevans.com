---
title: NixCon + SCaLE 2024
date: 2024-03-17T06:25:00-06:00
categories:
  - Travel
  - Conferences
tags:
  - Travel
  - NixCon
  - SCaLE
  - Pasadena
  - California
description: |
  I attended SCaLE for the first time this year and participated in the
  co-located NixCon.
image: ./images/scale.jpg
---

I attended NixCon and SCaLE in Pasadena, California for the first time this
year. I went with my friend [Addison](https://tgrcode.com), and while I was
there I also met up with some other friends, and made some new friends as well!

I flew out very early on Thursday morning from Denver to LAX. It was raining on
the way out of Denver, and the approach into LAX was quite windy. It was the
most turbulent flight I've been on in a very long time. Getting from LAX to
Pasadena was quite a journey. I had to take the Metro Connector from LAX over to
the Metro and then I took two metro lines up to Pasadena. It probably took an
hour and a half just on the metro to get there.

{{< figure src="./images/nix-banner.jpg" link="./images/nix-banner.jpg"
target="_blank" title="The Nix standard" >}}

I arrived at the convention centre about an hour after the planned start time of
the first NixCon talk, however due to technical difficulties with the projector,
the conference hadn't actually started by the time I arrived. The first talk was
an introduction to Nix workshop. It was generally all things that I was aware
of, but it was cool to see so many people interested in Nix! The next talk was
on [Nix Home Manager](https://nix-community.github.io/home-manager/). I'm a
maintainer of the project, so I also know how it works. The presenter did a good
job of explaining it, and showing people the benefits of using a declarative
system for defining your home environment. I think that at a future NixCon, I
want to actually give a talk about it. I didn't want to give a talk at this one
as it was my first time at a conference that wasn't free (like FOSDEM) and I
didn't know what level of quality was expected. I think that I am capable of
making a talk of the necessary quality for NixCon in the future, and I hope that
I'll have the opportunity to present in the future.

In the intermission between the talks, I went to the restroom and when I came
out, I ran into [Josh Hoffer](https://www.linkedin.com/in/josh-hoffer/) who I
went to Mines with! I didn't expect to see him there, but it turns out his work
is heavily centred around NixOS. He introduced me to his coworker
[John Rinehart](https://www.linkedin.com/in/johnrichardrinehart/) and we caught
up on what we have been up to since Mines.

After the Home Manager talk, I went to lunch and ended up at a taco place. I ran
into one of the presenters of the first talk (the introduction to Nix) and of
the talk that was coming up next about the Nix Module system. I met a few other
young professionals who were at the conference while in line waiting for my
tacos. [Nicolas (Nic)](https://nicfv.com/) works at
[NERSC](https://www.nersc.gov/) at the Berkeley National Laboratory, and
[Nathan](https://www.nathanieljwright.com/) and Tony work on database software
at [AVEVA](https://www.aveva.com). There were a couple other people in the
group, but I didn't get to know them as well during the conference.

After lunch, Nic and I went back to the Nix room for the workshop about Nix
Modules and then the one about CI with Nix. Addison arrived in the middle of all
this (his flight was delayed out of Las Vegas into Burbank).

By this time, Addison and I were quite tired due to the amount of travel we had
subjected ourselves to, so we headed over to our hotel to check in. Then after
grabbing some dinner we turned in for the night.

---

On Friday after a refreshing amount of sleep, Addison and I stopped for a _very_
healthy breakfast at Taco Bell before catching the bus over to the convention
centre.

The first talk that I attended was
[Will Fancher](https://github.com/ElvishJerricco)'s talk about using systemd in
stage 1 of the NixOS boot process. Stage 1 is the part of the boot process
primarily responsible for mounting the filesystems. Currently, stage 1 is
handled by a large sequential shell script, but using systemd will help allow
stage 1 to be handled concurrently. Additionally, systemd and journald will be
available on the fallback shell in case the boot fails. It was a very good talk,
and it was cool to learn about a new feature that will be turned on by default
soon in NixOS.

The next talk was by [Pierre Penninckx](https://blog.tiserbox.com/) about module
contracts, a technique for allowing users to have more control over the
sub-services that their services depend on. An example where this is helpful is
if you want to use a different database than the default module provides. Say
you want to use MySQL instead of Postgres in a module that hard-codes using
postgres, currently you cannot do that. I'm still not clear about exactly how
it's implemented, but I'm hopeful that this technique will become more common
and documented throughout nixpkgs.

After those two NixCon talks, I joined Addison and Nic at a talk by
[Achille Verheye](https://www.achille.fyi/) about an
[open-source rover hardware project](https://open-source-rover.readthedocs.io/en/latest/)
which allows people to create a scaled-down version of the JPL Mars rover using
consumer, off-the-shelf parts. It's a really cool educational project, and they
even had a little rover there for us to see!

Right after the rover talk, Addison, Nic, and I went to a talk by
[Nina Kin](https://www.linkedin.com/in/ninakin/) about transit data. She talked
about the General Transit Feed Specification (GTFS) which is an open data
standard for publishing transit schedules, stops, routes, real-time location,
and other information about public transit. This protocol is what apps like
Google Maps use to display information about transit routes, schedules, and
delays. Nina works for the LA Metro system as a tech lead, and was very
knowledgeable about how GTFS is used in the LA context and the specific
challenges that they have. One interesting thing she discussed was how different
routes may have odd definitions because the tram operators union requires
certain concessions. For example, at the end of a route, the operator needs to
have an opportunity to use a restroom and take a break, but some municipalities
don't allow the vehicles to stop and sometimes no local business is willing to
let the operators use their restroom. Because of this, sometimes two different
back-to-back routes are combined into one longer one which has more convenient
endpoints for the operator.

By this time, it was well into the afternoon and Addison, Nic, Tony, Nathan, and
myself went over to [King Taco](https://maps.app.goo.gl/QJAAJ6unST2h7fnG9) for
lunch.

We headed back to the expo hall at the conference. There were many vendors from
a variety of companies there. Everyone from Meta, Google and GitHub, to distros
like Gentoo had booths. I walked around and got various swag and learned about
some of the companies. I was wearing Beeper swag, and at one point, I was at a
booth talking to one of the employees manning the booth and the other employee
looked over and was like "oh do you work at Beeper!". It turns out that he has
been a user for a few months! He's the first user to say something to me about
Beeper besides people that I have told about it, so that was very cool.

Addison met up with another friend for dinner, and I went with Tony, Nic and
Nathan for burgers at [The Stand](https://maps.app.goo.gl/zpwhX8zEhned77UT7).
After dinner, Nic, Nathan and I met back up with Addison at the Pasadena Ice
Skating Center for the open skate. It was a nice way to exercise and do
something fun after the conference!

{{< figure src="./images/skating.jpg" link="./images/skating.jpg"
target="_blank" title="Nathan, Nic, Addison and myself ice skating" >}}

---

On Saturday, Addison and I once again stopped at Taco Bell on our way over to
the conference. The first talk of the day was a keynote from one of the creators
of the Julia programming language. Then, I headed over to the room for
_Reproducible and Immutable Software_. There was a lot of overlap with the
topics from NixCon, but it wasn't itself part of NixCon.

The first talk was by Kyle Davis about what actually is "immutability"?
Immutability is a word that we throw around a lot in the software world, but it
actually has deep roots in philosophy. The speaker told a story about him
discussing immutable software with a philosophy friend, and how she was confused
by his usage of the word "immutable" in the context of software. This
philosopher friend explained that in her world, immutable means "lacking the
ability to change" but it is deeper than that in that immutable things "cannot
_endure_ change". The only things which really qualify as "immutable" to a
philosopher are natural laws and entities such as deities. Even things which we
think of immovable like a rock do not qualify as "immutable" to the philosopher.

When we software engineers discuss immutability, we use a much looser
definition. The speaker discussed some of the aspects of the philosophical
definition which line up with the way that we use the word in the software
world. He discussed immutability in the context of programming languages,
databases, operating systems, and infrastructure.

The next talk in that devroom was by Samuel Raumin about how he uses Docker and
Nix as a computer engineer and in his role at university supporting developers
running their programs in a reproducible way.

After that talk, Nathan, Nicolas, Josh, Connor, John, and myself went over to
Yard House for lunch. We were trying to meet up with the Jupiter Broadcasting
group there, but the room was already full, so we just sat together and honestly
it was just as nice an experience. I got to hear more about the interesting
things that all of them do for work. For example, Connor works a lot on CUDA
support in NixOS.

In the afternoon, I followed Josh and John to the _Kernel & Low Level Systems_
track. Most of the talks were by Meta engineers who work on many different
low-level things to optimize the servers that Meta services run on.

The one that I understood the best was by Dan Schatzberg about SchedExt which is
a way to write and load CPU task schedulers written in BPF into the Kernel. The
existing task scheduler in the Linux Kernel is CFS (Completely Fair Scheduler)
which was made in 2007. However, much has changed since 2007 in processor
architecture, namely the rise of heterogeneous systems (high performance cores
and compute cores for example) and a proliferation of multicore CPUs (you'd be
hard-pressed to find a processor without multiple cores these days). Meta is
using SchedExt to experiment with different kernel task schedulers via a
sandboxed userspace environment. Two examples of techniques they experimented
with that were pretty cool were:

- Schedulers which try and take advantage of cache locality by scheduling tasks
  on processors that share an L3 cache so that less cache misses are incurred
  during process context switches.
- Schedulers which prioritize interactive workloads over CPU-intensive
  workloads. For example, prioritizing games over compiling the kernel so that
  you don't get choppy gameplay while the CPU is busy.

A lot of the talk went over my head, but I think I understood the broad strokes
of it, and it was cool to see some of the work being done related to computer
architecture and operating systems in industry.

I stayed around for a couple more talks in that devroom, but my brain was so
fried by this point in the week that I didn't really understand anything (not
sure if I would have understood anything anyway to be honest).

{{<figure src="./images/scale.jpg"
  link="./images/scale.jpg"
  target="_blank"
  title="Some of the SCaLE crowd we hung out with"
  caption="Left to right: (random guy Addison ran into), Nathan, Josh, Addison, Nicolas, myself."
>}}

In the evening, a friend of mine,
[Jon](https://www.linkedin.com/in/jonathan-schatz-0214ba252/), who lives in
Burbank and flies for JSX came to pick me up and we went to dinner together in
Glendale. Jon used to live down the street from us when we were kids, and it was
cool to catch up. We went to
[Crazy Rock'n Sushi](https://maps.app.goo.gl/Mohdkub9TAWqMEXY6) and then walked
around the downtown area. The whole downtown area was really nice, and seemed to
be a popular place to be. In one area, there was a cool pedestrian area with
lots of shops and restaurants. It felt like a very vibrant downtown area.

---

On Sunday, there were not many talks (which was a good thing because it was
pretty intense) so Addison and I slept in a bit and then went to the exhibit in
the morning. I hung out a bit at the Nix booth and then made my way over to a
talk in the _Reproducible and Immutable Software_ by Las Safin about WASM
Derivations in Nix. His point was that this would allow for better sandboxing
and I thought it was an neat idea. The most interesting part about it was that
[Eelco Dolstra](https://github.com/edolstra) (whose PhD dissertation is the
foundation for Nix, and who continues as a major contributor to the Nix project)
was there and asked many questions of the speaker. It's cool to see that Eelco
is still engaged with the community that his work created.

After that talk, Addison and I ended up going to lunch at an Italian restaurant
with a group of people who were there primarily for NixCon, including two
Nixpkgs committers ([Nick Cao](https://nichi.co/) and
[Ben Siraphob](https://siraben.dev/)) and some students who came up by train
from San Diego. Ben is getting his PhD at Yale and actually works in an adjacent
research group to
[Jordan Schmerge](https://www.linkedin.com/in/jordan-schmerge/) who I know from
Mines! Jordan graduated a couple years ahead of me and started his PhD at Mines
so our paths crossed a couple times. The tech industry is simultaneously huge
and small. Knowing people is very important not only for career prospects, but
also for having people in your life who are similarly passionate about
technology. Most of the lunch group headed back to the conference centre and
spent a good part of the afternoon nerding out about Nix together as the
conference was coming to a close.

Addison and I headed back to the hotel and relaxed for a little while and then
we took the metro down to a Korean BBQ restaurant in Koreatown to meet up with
my friend [Ethan Cranston](https://ethancranston.com/) who I'd come to see in LA
[last year]({{<ref"../2023-los-angeles/index.md">}}). Ethan works at SpaceX, and
it was nice to catch up with him and eat some fantastic food. The Metro ride
back was a bit sketchy. I'm glad that I was with someone else that late at
night.

---

Addision left Monday morning, but I stayed around until the evening. After
taking my daily standup meeting from the hotel, I headed over to a WeWork for
the day. I understand why WeWork went bankrupt: they really do not have enough
people coming in to their locations to break even it seems. There were maybe a
dozen people there, and it just does not seem like the prices are high enough
for them to be profitable. I'm guessing that the only reason they didn't go
bankrupt even faster is because of companies subletting private office space
within the WeWork. I won't complain, though: I'll enjoy the VC-subsidised,
trendy workspace all day long.

After work, I took the metro down to El Segundo where Ethan lives. It was much
less sketchy during rush hour. We went to an Italian restaurant with one of his
friends named Philip, and then they drove me to LAX for my flight back to
Denver.

---

I thoroughly enjoyed the conference, and it was a nice time to be able to interact
with people who are interested in the same sorts of technology as myself. It was
fun travelling with Addison, and it was fun to run into Josh and catch up. It
was nice to meet up with old friends like Ethan and Jon as well as make new
friends like Nicolas and Nathan, and I hope that NixCon is once again collocated
with SCaLE so that I make a trip to LA to can attend both conferences again and
hang out with my friends out there.

I enjoyed all of the talks and learning from people who are doing such a variety
of interesting things spanning so many disciplines. This was my first time at a
larger conference, and I think that I would like to try my hand at giving talks
at future conferences. I presented at the small
[Berlin Matrix Summit]({{<ref"../2022-berlin-matrix-summit/summit/index.md">}})
in 2022 but I wasn't sure what a larger conference would be like. Giving a talk
doesn't seem as daunting as I thought it would be, and I think that it will be a
good growth opportunity.
