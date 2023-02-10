---
title: "FOSDEM 2023"
date: 2023-02-05T06:25:00-06:00
categories: [Trip to FOSDEM 2023]
tags:
  - Travel
  - FOSDEM 2023
  - Matrix
  - Matrix Community Meetup
  - HSBXL
  - Go
  - NixOS
  - Brussels
description: |
  I attended FOSDEM for the first time this year and I had a blast!
  I enjoyed attending many talks, but the best part was getting to meet so many
  cool people.
---

For the first time since 2020, FOSDEM was held in-person in Brussels. FOSDEM is
one of the largest gatherings of open source enthusiasts in the world every
year. My employer, [Beeper](https://beeper.com), funded my flight, and I decided
to attend. It was a great experience! I learned a lot and have a long to-do list
of projects to try out. I also really enjoyed interacting with the Matrix
community and reconnect with many of the people who I'd met at the [Matrix
Community Summit in Berlin last year]({{< ref "../../2022-berlin-matrix-summit/summit" >}}) and meet a bunch new people as
well.

## The Matrix Community Meetup

The conference was Saturday and Sunday, but there was also a Matrix Community
Meetup on Friday that I attended at HSBXL.

HSBXL is a hackerspace in a nearly-abandoned building in a very convenient
location in the heart of Brussels. They were gracious enough to host the meetup.
[Yan](https://www.linkedin.com/in/yncyrydybyl/) (who was one of the organizers
of the Berlin summit) and [Kim](https://github.com/harharlinks) (who attended
the Berlin summit) did a great job organizing the meetup.
[Famedly](https://www.famedly.com/) and [Nordeck](https://nordeck.net/)
graciously funded pizza and drinks for the event.

The meetup was a great success. By the time I arrived at HSBXL a few minutes
after 13:00, there were already a couple dozen people there, and throughout the
afternoon the number of people in attendance at least doubled if not tripled.

The meeting was organized as a barcamp, but I think that most of the discussion
groups ended up morphing into topics other than the one intended and/or other
adhoc discussions began.

The most valuable part of the barcamp-style is the introductions round at the
beginning where everyone in attendance quickly introduces themselves and
mentions who they were, why they were interested in Matrix, and what they were
interested in discussing. I was excited to put faces on many of the MXIDs that I
interact with online.

One of the discussions that I took part in was about [sliding
sync](https://github.com/matrix-org/matrix-spec-proposals/pull/3575) which is a
proposal for a new way to sync data from Matrix servers to Matrix clients.
[Kegan](https://www.linkedin.com/in/kegan-dougal-218b3830/) is the main
architect behind the MSC and he answered many questions about the proposal and
we had interesting discussions about some of its benefits and limitations.

Throughout the afternoon and evening I got into a variety of conversations with
various great people. I was especially happy to get to meet
[Marcel](https://github.com/mtrnord), [Timo](https://github.com/timokoesters),
[Andrew](https://github.com/anoadragon453), and
[Ben](https://www.linkedin.com/in/benparsons/) in-person because they are very
active in the community and I'd only ever interacted with them online. I was
also happy to reconnect with [Nico](https://neko.dev/), Kim, Yan,
[Christian](https://chrpaul.de/), [networkException](https://nwex.de/), Shine,
Dominik, Phillip, Jannik, and others who I'd met at the Berlin summit.

After the event was over, a group of us headed out for burgers. It was a great
opportunity to get to get to know some more cool people and hear about their
connection to the Matrix ecosystem.

{{< figure
      src="./images/burgers.jpg"
      link="./images/burgers.jpg"
      target="_blank"
      title="Getting burgers with a bunch of Matrix developers and enthusiasts"
      caption="The Matrix community is full of interesting and talented people from around the globe."
>}}

## It's Go Time!

On Saturday, there was no scheduled Matrix talks, but there were many other
interesting dev rooms at FOSDEM. Getting to Université libre de Bruxelles (ULB)
via the tram was an adventure, though. There were so many people going towards
FOSDEM that the tram was totally full and I had to squeeze in! After finally
arriving there, I went to get my FOSDEM t-shirt (if you don't get the shirt, did
you even go?) and then I headed over to the Go dev room.

{{< figure
      src="./images/godevroom.jpg"
      link="./images/godevroom.jpg"
      target="_blank"
      title="Waiting for the talks in the Go dev room to commence"
      caption="The organizers of the dev room did a terrific job and all of the talks that I attended were very interesting."
>}}

I've been using Go fairly extensively at work, and even
[did last year's Advent of Code in Go]({{< ref "../../../programming/2022-advent-of-code" >}}).
The first talk was what's changed in Go since the last in-person FOSDEM. I only
really started programming in Go seriously last year, and I wrote my first Go
program only about two years ago, so it was interesting to hear from someone who
has been around for much longer than that. The thing that struck me the most was
the fact that not much in the core language had actually changed. Go is very
cautious about changing the core language which is quite nice in my opinion.

The standard library has had more changes, and especially interesting to me was
the ability to wrap multiple errors using the `errors` package. I was unaware of
being able to wrap *any* errors, so I am going to definitely have to look into
how to utilize that functionality in my projects.

Also of interest was the `crypto/ecdh` package which adds support for Elliptic
Curve Diffie-Hellman key exchanges. Although the primitives already existed in
`crypto/elliptic`, this is a nice standard implementation. Since the Matrix
encryption protocol makes heavy use of ECDH key exchanges, I think there's
potential for integrating usage of this package into Matrix projects such as the
Go re-implementation of the Olm protocol
[go-olm](https://codeberg.org/DerLukas/goolm).

The next talk was about some techniques to write cleaner Go code. A few of the
ideas were really interesting things that I hadn't thought of before. I was
especially interested in the "line of sight" heuristic for good code structure:
the happy path should be aligned on the left, and the error handling should be
indented.

Another pattern that I thought was interesting was reducing "mysterious
boolean" arguments by giving them names. Since creating new types is free, you
can improve the readability of the code calling a function that accepts booleans
by instead accepting a new type that is an alias for `bool`:

```go
type EnableWebhookOption bool

const (
    WebhookEnabled  EnableWebhookOption = true
    WebhookDisabled EnableWebhookOption = false
)

func Setup(name string, webhookEnabled WebhookEnabled) {
    ...
}

// later
Setup(name, WebhookDisabled)
```

I took a break for a couple of talks and got an early lunch at one of the food
trucks that was in the ULB plaza.

When I came back, I watched a couple talks on optimizing Go code including one
about how to use *string interning* to reduce memory usage of Go programs. The
second one talked about benchmarking techniques, and I learned about how to use
the `testing.B` type. I once again left the dev room and wandered over to the
sponsor hall to say hi to the people at the Matrix Foundation table.

Eventually I ventured back to the dev room. In between two of the talks, I heard
a voice behind me that sounded very familiar, but I couldn't quite place it.
When I turned around to look, the person from whom the voice was originating was
wearing a [Go Time podcast](https://changelog.com/gotime) t-shirt and realized
it was one of the hosts of the show! It turned out to be Mat Ryer. It was fun
meeting someone who I've spent many hours listening to in the car in real life!

Towards the end of the day, there was a talk by
[Ronna Steinberg](https://fosdem.org/2023/schedule/speaker/ronna_steinberg/)
asking the question: is Go object oriented? She provided arguments for why it is
and why it is not object oriented, and I will have to say both arguments are
quite convincing. Go does not have inheritance and polymorphism in the same way
that languages like Java do, but it does have methods and a way of doing duck
typing.

In my mind, object oriented programming has a lot of baggage these days because
of Java. However many of the concepts from OOP are extremely valuable and Go has
learned a lot from those concepts (although its implementation may not resemble
what people imagine of when they think about OOP).

At the very end of the day, there were a few lightning talks. Kegan Dougal (one
of the engineers at Element that I met last night) gave a quick talk about the
`runtime/trace` package which can be used to understand the performance of Go
programs.

I really enjoyed the Go dev room. Maartje did a great job running the room, and
I learned some interesting techniques that I can try and apply in my projects.

--------------

In the evening, a bunch of us Matrix folks went out
[Arion](https://www.arionbrussels.be/en/the-brasserie-belgian-cuisine/), a
Belgian restaurant. We basically took over one side of the restaurant. I ended
up at a large table and one of the people at my table was
[Daniel](https://dandellion.xyz/) who is a fellow Matrix and NixOS enthusiast.
We'd met earlier in the day briefly, but it was cool to talk to him in person
since we'd interacted with one another in multiple different online communities.

I also spent a while talking with Andrew, Ben, Kegan, and Florian about what
Beeper is working on and ways we can collaborate with Element on common projects
such as the [complement test suite](https://github.com/matrix-org/complement).
It was great spend time with them in person, and now when I interact with them
online, I have a much better understanding of who they are.

## Entering the Matrix

On Sunday, I took a different route on a much less crowded bus and was able to
make it to the ULB campus in time for the start of the Matrix dev room. I even
had time to get a chocolate-covered Belgian waffle for breakfast! (It was
delicious.)

At the beginning of the Matrix devroom, Matthew and Amandine presented a short
talk about the overall Matrix ecosystem including this quite exciting graph of
Matrix' growth.

{{< figure
      src="./images/matrixdevroom.jpg"
      link="./images/matrixdevroom.jpg"
      target="_blank"
      title="Matthew and Amandine talking about Matrix adoption"
>}}

I'm fairly connected with the happenings within the Matrix ecosystem, but it was
great to hear about the cool things that people are working on. For example,
Kegan talked about his work on Sliding Sync which intends to provide a more
configurable interface for clients to retrieve data from the server. Kim and
Oliver from Nordeck demoed some of their work on Matrix widgets and how they
have been able to leverage them to extend Matrix to suit their needs as well as
the needs of their clients.

At the end of the morning, Yan (who had MC'd the dev room all day) presented a
talk about a bunch of exciting projects in the Matrix ecosystem that are a bit
less well known. The Matrix ecosystem is growing constantly, and there are some
excellent community projects that are pushing the boundaries of what can be done
with Matrix. For example, outside of the dev room, I ran into Milton and Conor
who are working on a really interesting project for using Matrix as the backing
store for a web forum.

## NixOS

For the afternoon, I headed over to the NixOS dev room with Daniel. They ran out
of room in the dev room (apparently NixOS is very popular!) and we had to wait
outside for quite a while before we got inside.

One of the talks that interested me was about using the Nixel language to write
Nix expressions. Unfortunately because the talks were so short, the presenter
only had enough time to whet my appetite for learning more about the project,
which I definitely intend to do!

I was also especially excited to hear the talk by [Domen
Kožar](https://www.domenkozar.com/) about [direnv.sh](https://devenv.sh/) which
is a way to configure development environments using Nix. I am definitely going
to have to look into it and see if it works well for my projects.

## Matrix 2.0

Late in the afternoon in the main auditorium, Matthew presented a talk titled
*Matrix 2.0* (not related to the spec version) in which he described the active
work being done to speed up Matrix: sliding sync and faster joins over
federation.

He also talked about some of the interesting fringe projects such as switching
to OIDC for authentication, using Matrix as a signalling layer for group video
calls, and using Matrix as a signalling layer and system for a metaverse-like
environment.

{{< figure
      src="./images/matrix20.jpg"
      link="./images/matrix20.jpg"
      target="_blank"
      title="Matthew presenting some of the recent developments in Matrix"
      caption="The Matrix Foundation has high aspirations for Matrix including using it for applications other than chat."
>}}

After the Matrix 2.0 presentation finished, I met up with some Matrix folks and
we eventually wandered back towards the Matrix table in the sponsors hall and
tried to decide on dinner plans.

A large group of us ended up heading towards the Bruxelles-Midi station for
dinner, but due to train schedule changes, we had to say goodbye to a few of our
group before we got to a restaurant. I hope that I'll be able to catch up with
them at another event soon!

The remaining group went to a Thai Wok restaurant where we had a great time.
It's interactions like these that make travelling to these conferences worth it.
The Matrix community is full of wonderful people, and it's always nice to spend
time with everyone.

## See you next time!

Overall, I quite enjoyed my time at FOSDEM, and I have filled my to-do list full
of new ideas and concepts to look into. I hope I can return again next year and
attend even more fantastic talks.

I also hope that I can see many of the Matrix community members again at another
event soon!

As far as the vision that Matthew laid out in his *Matrix 2.0* talk, I'm most
interested in the interoperable chat aspect. While the rest is flashy and
interesting, **if Matrix doesn't become the backbone for interoperable chat, the
damage that siloed chat platforms do to personal privacy and data sovereignty
will continue to go unchecked.** At Beeper, we are trying to make the best chat
app ever, and we are doing so on top of the Matrix protocol because we believe
in the power of interoperability and openness. But we are by no means the only
ones trying to make amazing Matrix chat apps a reality. Matrix is on the brink
of becoming the global standard for interoperable chat. This is a
once-in-a-generation (maybe once-in-a-lifetime) opportunity to define the future
of chat: will it be a horribly privacy-invading, siloed future? Or will it be a
glorious interoperable future?

In the words of Ben Parsons, **"Matrix is booming!"** The community is strong,
talented, innovative, and energetic. Let's take advantage of the momentum we
have and strive to build amazing chat apps on top of Matrix to bring even more
people into the glorious interoperable future!
