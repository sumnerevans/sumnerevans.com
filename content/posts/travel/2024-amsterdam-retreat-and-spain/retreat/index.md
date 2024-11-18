---
title: "Amsterdam, Netherlands - Work Retreat"
date: 2024-11-08T09:25:00-06:00
categories:
  - Travel
  - Trip to Amsterdam and Spain 2024
  - Work Retreats
tags:
  - Travel
  - Amsterdam
  - Netherlands
  - Beeper
  - Automattic
  - Work
description: |
  This week, Beeper (now part of Automattic) had a week-long work retreat in
  Amsterdam, Netherlands. These are my thoughts and reflections on the trip.
image: images/team.jpg
build:
  publishResources: false
---

This week, Beeper had our second meetup after being
[acquired by Automattic](https://blog.beeper.com/2024/04/09/beeper-is-joining-automattic/)
earlier this year. Unlike the
[last retreat in Porto]({{<ref"../../2024-porto-retreat/retreat/index.md">}})
which had lots of other Automattic employees in attendance, this was just our
team and was focused on work and planning less than team-building.

Automattic is a [remote-only company](https://automattic.com/about), so work
retreats are the only time that we can connect with our co-workers in-person and
build stronger personal relationships with among the team. The best part is that
we get to go to cool locations for these meetups. You can read about all the
previous [work retreats on this blog]({{<ref"/categories/work-retreats">}}).

For this retreat, we returned to
[The Social Hub Amsterdam City](https://goo.gl/maps/DeqBLLtmbuR9Ne8Y6) which was
one of the best retreat locations in my opinion. We had a co-working/conference
room to ourselves.

{{<figure
  src="images/team.jpg"
  title="The Beeper team">}}

## Vision and Execution

During the first day of the retreat, Brad and Kishan talked about the technical
and product visions for Beeper next year and beyond. At the highest level, our
goal is to make the best chat app. To accomplish that, we need to build a lot
more features to gain parity with the existing chat apps. We need to finish our
transition to local bridges, we need to improve the reliability and speed of our
backend infrastructure, make our clients faster and more native-feeling, and
much more.

{{<figure
  src="images/vision-talk.jpg"
  title="Vision talk"
  caption="The team listening to Kishan's vision for Beeper's future.">}}

In order to execute our lofty goals, we have to work together effectively as a
team. One of the team leads, Matt Wondra, led a discussion about working norms
and expectations which was quite unifying as we all agreed on the overall
expectations, and the only discussion points were tactical in nature.

## Telegramming

The main thing I worked on was the Telegram bridge. I've been rewriting it in Go
since the last retreat and we released the new bridge to all users a few weeks
ago. However, there has unfortunately been a very long tail of bugs that have
caused users to experience edge cases that we didn't detect during our internal
testing.

I took advantage of having [Tulir](https://mau.fi) right next to me to discuss
and fix some of the most prevalent bugs, but there is still more work to do.

## The Server's on Fire

Over the last few months, the on-call rotation for the Platform team have been
plagued by lots of unactionable and spurious alerts that have caused the team to
get a real case of alert fatigue. In fact, we had quite a few alerts during the
retreat itself. As we were travelling to dinner on one evening, an alert came
through and Brad had to respond on his laptop in the Uber. I was also woken up
overnight on Tuesday which was quite brutal as I was just starting to get a bit
accustomed to the new timezone.

The Platform team had already planned to discuss strategies to reduce the alert
burden, but the alerts during the retreat helped remind us why we wanted to do
so! We discussed strategies to not only reduce the alert burden but also
recommitted to prioritising investigating and mitigating persistent alerts. I'm
excited that we are prioritising stability as that will become more and more
necessary as we grow our userbase and as our infrastructure grows in complexity.

## Localling All of the Bridges

As announced in our
[How Beeper Android Works](https://blog.beeper.com/2024/04/09/how-beeper-android-works/)
blog post earlier this year, we are working to run bridges within the client.
This was the impetus behind rewriting all of the bridges in Go using a common
bridge framework so that we can integrate them into the clients.

During the retreat, there was lots of cross-team collaboration and testing to
work out the interface details between bridges and clients. I was not involved
in this, but it was neat to see all of the cross-team collaboration.

## Rematch!

At the
[last Amsterdam retreat]({{<ref"../../2023-amsterdam-retreat/retreat/index.md#i-can-play-the-nine-ball">}})
one of the highlights was playing pool with the team. We of course had to have a
rematch. Tulir and Toni beat me and Nick twice! I guess we will have to return
for yet another rematch!

{{<figure
  src="images/pool.jpg"
  title="Playing pool with (most of) the Platform team"
  caption="Nick and I at least got down to one ball left both times, so it wasn't a total blow-out.">}}

---

Overall, this retreat was a productive and encouraging one. I'm excited about
the plans we have for the future, and I am encouraged by how well the team works
together. I was happy to get to work in-person with my team, and discuss how we
are going to improve our oncall experience moving forward.
