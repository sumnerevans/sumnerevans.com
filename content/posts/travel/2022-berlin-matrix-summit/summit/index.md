---
title: "Berlin Matrix Community Summit"
date: 2022-08-28T12:00:00-06:00
categories: [Berlin Matrix Community Summit 2022]
tags:
  - Travel
  - Berlin
  - Germany
  - Matrix Community Summit
description: |
  The Berlin Matrix Community Summit was the first Matrix-only event. Hosted in
  Berlin, it was an action-packed meeting of many of the greatest Matrix-minds.
draft: true
---

The main purpose of my trip this week was for the Berlin Matrix Community
Summit, an event organized by members of the Matrix community in Berlin. Matrix
is the chat protocol that Beeper (the company I work for) is building our chat
app on top of. The protocol is developed openly, and has a large community of
open source developers, projects, and businesses all building on top of Matrix.
This summit was the first Matrix-only event. There have been other events at
which Matrix had a large presence such as FOSDEM, but this was the first
ever Matrix-only event.

The people attending the event had quite diverse reasons for attending. Some,
like myself, work full time at companies building on top of Matrix. Others were
system administrators at various institutions that are running Matrix servers
for their chat platforms. Still others were enthusiasts building projects with
Matrix or wanting to learn more about the ecosystem. In total, at least
fifty-seven people were in attendance!

{{< figure
      src="./images/first-day.jpg"
      link="./images/first-day.jpg"
      target="_blank"
      title="Some of the participants from the first day"
      caption="We are about to watch Christian present some of the advancements that have happened in the Matrix ecosystem over the past year."
>}}

The summit was held at c-base, an open-source-focused hackerspace in the heart
of Berlin. There were three rooms for talks and workshops, and a packed schedule
with three tracks throughout most of Friday and Saturday. There was also space
outside by the River Spree with tables to hang out at.

# Barcamp

On Thursday we had a [barcamp](https://en.wikipedia.org/wiki/BarCamp) which
comprised of a meet-and-greet and introductions followed by creating a small
schedule of discussions on some of the topics where there was mutual interest.
At the discussions I attended, we talked about bridges, server load testing,
various clients, and the Matrix specification.

In my opinion, the most interesting thing about the discussions was getting to
know some of the conference participants and learn from their expertise and also
their questions. The experience that everyone brought was quite diverse: Nadine
is a UX designer, Nico is developing a native Qt Matrix client called Nheko, Jan
is a network administrator of a Matrix deployment at Universität Graz in
Austria, Christian works on bridges at Element, I work on Bridges at Beeper,
Aiman just started working at a company that is building tools for bridging
chats across multiple chat networks through Matrix, Jose works at a company
building tools for businesses to bridge customer support chats into Matrix, Kim
develops bots and runs a homeserver for a couple dozen users, networkException
is a high school student who maintains various open source projects including
some related to Matrix, Henri and Charles are working on two unrelated social
media platforms built on top of Matrix, and that was just a some of the
participants in the barcamp which itself a small subset of all the conference
attendees.

At the end of the day, we had a barbecue sponsored by Beeper with steaks,
bratwursts, grilled vegetables, and cheeses along with some break and lots of
different sauces. Yan and Nadine were the main ones in charge of the conference
food, but as the only Beeper employee in attendance, I did my best to help. They
had thought of pretty much everything, though, so my role was mainly to take
credit for securing funding for the food :)

# Talks and Workshops

On Friday and Saturday, there was a full schedule of thirty-six talks and
workshops hosted by twenty-four different presenters. During most of the
conference, there were three tracks going at once. There were so many that I was
not able to attend all of the ones I wanted to attend! I'll give a few
highlights of talks and workshops that I enjoyed.

* **Valentin's *Show us Your Homeserver* workshop**

  As one of the first workshops of the summit, Valentin facilitated a time for
  people to discuss their homeserver configurations.

  He had many interactive activities where we would break into groups based on
  various options that we had selected for our homeserver setups and discuss why
  we had chosen that particular setting. It was cool to get to meet some other
  homeserver admins and see what they were doing for their setups.

  {{< figure
      src="./images/homeserver-workshop.jpg"
      link="./images/homeserver-workshop.jpg"
      target="_blank"
      title="Having fun nerding out about homeserver setups"
      caption="Valentin was a great facilitator and got us up and moving and talking to each other about our setups."
  >}}

* **Alex's Kubernetes talk**

  In a presentation about his homeserver setup, Alex Babel discussed how he uses
  GitHub, ArgoCD, and Kubernetes to manage his Synapse instance. The talk was
  quite interesting and it was cool to see a smaller homeserver deployed using
  Kubernetes. We deploy using Kubernetes at Beeper, but it's managed by another
  team, and it's quite complicated, so I don't really have a grasp of what's
  going on, but it was easy to understand Alex's setup since it was at a smaller
  scale.

* **Ben's Rust SDK talk**

  The lead developer on the Rust SDK from Element presented their work on the
  Rust SDK. The talk discussed why the new SDK was being developed, examined the
  features and benefits of the latest SDK, and he gave a preview of some of the
  things that they are planning on implementing next.

  {{< figure
      src="./images/rust-sdk.jpg"
      link="./images/rust-sdk.jpg"
      target="_blank"
      title="Ben presenting the new Matrix Rust SDK"
  >}}

* **Hato's presentation about collaboration widgets for public-sector**

* **Kim's Matrix Reminder Bot demo**

* **Yan's Conclusion Talk**

  Yan, one of the main summit organizers gave the keynote presentation to
  conclude the summit. His talk was about the future of Matrix, and he
  "communicated with a user in the future" via Matrix who told him all of the
  great things that would happen in the Matrix ecosystem.

  The conclusion of the talk was an admonition to go build the future we want to
  see!

There were many other great talks and workshops, some that I was able to attend,
and others that I wasn't able to attend. The quality of the talks was fantastic,
and I learned tons from everyone at the summit.

# Presentation Time!

In addition to attending many talks and workshops, I gave a few as as well. On
Friday, I gave a [presentation about Hungryserv]({{< ref
"/portfolio#presentation-hungryserv" >}}), a project that we are pursuing at
Beeper to help us scale to more users. I was happy that so many people were
interested in the project, and the attendees had many great questions.

{{< figure
      src="./images/hungryserv.jpg"
      link="./images/hungryserv.jpg"
      target="_blank"
      title="Presenting our new sharded architecture"
      caption="Hungryserv is the center of our new sharded architecture for scaling our infrastructure to support more bridges."
>}}

On Saturday, I gave a presentation about [what Beeper is working on]({{< ref
"/portfolio#presentation-what-is-beeper-working-on" >}}). I explained our
vision, talked about Beeper, discussed what we've built and what current
challenges we have, and described what it's like working at Beeper.

{{< figure
      src="./images/what-is-beeper-working-on.jpg"
      link="./images/what-is-beeper-working-on.jpg"
      target="_blank"
      title="Presenting what Beeper is working on"
      caption="Here I'm presenting our simple business model: users pay money for a service"
>}}

I also teamed up with Kim to give a workshop on how to write Matrix bots in
Python. He presented
[simplematrixbotlib](https://github.com/i10b/simplematrixbotlib/) and I
presented [maubot](https://github.com/maubot/maubot). Then we gave participants
some time to work on a bot of their own.

It was a pleasure to be able to give the talks and tell people about things that
I'm passionate about.

# The Hallway Track

* long night at the museum
* Sunday hang out
* Beeper BBQ
* Element dinner


* talks on the next days
  * valentin workshop
  * Alex K8S
  * ??
  * Yan conclusion

* Dinner with Kim

# Conclusion

I think the Matrix ecosystem has a bright future ahead of it. I feel like all of
us in the community are at the start of something big. There are so many smart,
energized people working on Matrix, and I feel fortunate to have been able to
get to know a few of them at the summit.

I think that history will look at many of the people in attendance at the summit
as pioneers of their respective niches in the Matrix ecosystem. The great thing
about the Matrix ecosystem is that it's not dependent on a single entity; there
is no single point of failure.

The future of Matrix is bright: now we just have to go build it!
