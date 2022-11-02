---
title: "Mexico City, Mexico --- Work Retreat"
date: 2022-10-22T09:25:00-06:00
categories: [Work Retreats]
tags: [Travel, Mexico City, Mexico, Beeper, Work]
description: |
  My thoughts and reflections on the Beeper Fall 2022 retreat in Mexico City.
draft: true
---

This week, my company (Beeper) had our Fall retreat in in Mexico City, Mexico.
We have company retreats about once every four months and this was our fourth.
Similar to all [the](../2021-dc-montreal/2021-09-13-17-montreal)
[previous](../2022-playa-del-carmen-mexico)
[retreats](../2022-lisbon-and-paris/ericeira-portugal), the goal was to provide
valuable in-person time to collaborate and connect as a team on a personal
level. I was able to meet a couple people who had joined the company since the
last retreat and reconnect with many coworkers that I'd met during previous
retreats.

We had fifteen members of the team at this retreat. We stayed at a hotel called
[*Camino Real
Polanco*](https://www.caminoreal.com/en/caminoreal/camino-real-polanco-mexico),
and we were able to utilize some office space from another Y-Combinator startup.
Having the office was a nice change from the remote locale of the Portugal
retreat.

I shared a room with Bradley who works on our desktop app. The hotel room was
quite nice and there were quite a few restaurants close by. The retreat was less
communal in feeling than the previous two in [Playa del
Carmen](../2022-playa-del-carmen-mexico) and
[Portugal](../2022-lisbon-and-paris/ericeira-portugal), but (as I'll describe
later) this retreat was more work-intense than the previous ones and having the
ability to go back to our rooms to decompress was quite nice.

## Meeting Coworkers

One of the best things about the retreats is being able to put a physical person
behind the Zoom box that I see every day at standups and planning meetings. This
retreat I was able to meet three people for the first time: Obed, a Puerto Rican
member of our support team; Matt "Laser", an Android developer from Ohio; and
Max, a Finnish backend developer who is currently working on our new
[Slack](https://github.com/mautrix/slack) and
[Discord](https://github.com/mautrix/discord) bridges.

I was also able to spend time with people who I'd met at previous retreats. We
have demos every week on Monday where anyone in the team can demo what they are
working on, but not everyone demos something every week, making the retreats a
nice time to hear about what people have been working on for the past few
months. Since the last retreat, I have mainly been heads-down on a project
called *Hungryserv* with Toni and Tulir so I haven't been as attuned to what
everyone else working on.

## Working and Learning

This retreat was the most meeting-heavy one we've had, but each was extremely
valuable. We had five full-team meetings, and I think that if our retreat
consisted just of those meetings it would have been worth it.

On Tuesday, Eric talked about our plan for next year and laid out an exciting
vision for growth. It's always great to hear his high-level thoughts on where
the company is going. Obviously I can't share most of it publicly, but I can say
that the future is bright, and you can expect big things from Beeper coming into
the new year.

### Retro

The week kicked off with a retro meeting led by Brad. We of course had to get
our sticky note peeling lesson from Annie so that our retro post-it notes
wouldn't bend at the sticky part and subsequently fall off of the windows.

{{< figure 
      src="./images/retro.jpg"
      link="./images/retro.jpg"
      target="_blank"
      title="Obed (standing right) discussing his retro sticky notes"
      caption="We had a beautiful view of Mexico City in the background as the team participated in what has become the unofficial starting point of each retreat."
>}}

There were a few themes which I think were especially prevalent throughout the
retro which was overall extremely positive.

On the infrastructure side, there was an overwhelming sense that the Hungryserv
project has been a resounding success. The project was a brainchild of a couple
of discussions that myself and Toni had just before the Portugal retreat. During
the last retreat, it was still vaporware, but over the last few months, with
Tulir, Toni, and myself full-time on the project, we are now ready to ship to
production. In fact, even in August ago, we were close enough to having it
working that I was able to [give a
presentation](../../../portfolio#presentation-hungryserv) about the project at
the [2022 Berlin Matrix Community Summit](../2022-berlin-matrix-summit/summit).

Another highlight was the progress on the iOS application over the past few
months since we reorganized the teams a couple months ago to put more people on
the iOS project. The team has worked hard restructuring much of the app
including rewriting the backend data storage systems and rewriting the
conversation view. Although most of the work they've done is not immediately
visible, the improvements have made the app significantly faster and more
reliable.

On the Android side of things, we entirely overhauled the Android SMS bridge,
and users can now set Beeper as their Android SMS app. The desktop app has also
seen many improvements including a new conversation view with advanced
power-user features and a greatly improved timeline. All of the clients have
also implemented functionality to display when each message gets delivered
successfully to the external network.

### Matrix is Simple

Unfortunately, not everything is going well, and the complexity of the Matrix
SDKs our clients use has been the cause of much pain. However, much of the
complexity is unnecessary since, at its core, Matrix (the protocol we are
building Beeper on) is simple.

On Tuesday and Wednesday, Brad gave two comprehensive presentations covering the
fundamentals of Matrix from a client perspective. The first one was about the
inner workings of sync: the only real-time way that data is provided to client.
In general, I was quite familiar with sync because I implemented significant
portions of it for Hungryserv. I think it was valuable to have all of that
information consolidated in a single presentation. The second presentation was
about how encrypted messages work in Matrix. Brad covered things like how the
device verification process and what keys exist and how they are shared between
devices. I was generally familiar with how encryption works in the Matrix
ecosystem, however I didn't know much about how key sharing or device
verification worked, so it was great to get some background on that.

On Thursday, we had a meeting about best practices for clients to follow. Some
of the topics were around how to handle specific edge cases while other
discussions included best practices for event storage structures.

Although there are many pieces to Matrix, it is elegant and simple in many ways.
Many of the problems that our clients have are due to mishandling of sync or
encryption deep within the various libraries that we are using. I think that now
that everyone in the company has a working understanding of those fundamental
pieces of the system we can more effectively identify the root causes of bugs
and fix the issues that our users experience.

### Odds and Ends

Other than the meetings with the entire team, there were quite a few other
planning meetings that subsets of the team participated in. Most of the people
that I work with directly were not at the retreat, but I joined in a couple of
ad hoc conversations about various topics.

Max was the only person there on my direct team, and he was working on infinite
backfill for the Slack bridge. I provided "moral support" to his efforts, and
occasionally offered insights into how the other infinite-backfill-enabled
bridges work.

### BRAD Day

Every three weeks we have a Beeper Radical Awesomeness Day (BRAD). It's a day
that every employee in the company can work on anything we want, so long as it's
company-related, and as long as we present it at the following week's demo
meeting.

It just so happened that the Friday of the retreat coincided with our regularly
scheduled BRAD days, so we all got to hack on fun projects on Friday. I chose to
work on the [GroupMe bridge](https://github.com/beeper/groupme) which had been
worked on by Annie and Nick at the Montreal retreat over a year ago, but needed
some serious attention. I spent the day getting it up to current Beeper
standards for bridge building, and will continue working on it during the next
BRAD day.

Other people on the team did cool projects as well. Max worked on rendering a UI
on an embedded device that has a BlackBerry keyboard and a monochrome screen;
Tiago worked on integrating Google's password store into the Android app; and
Wellington added recently used emojis to the iOS app. There were quite a few
other cool projects as well. It's always nice to have some time to work on
features that aren't currently high priority on the roadmap.

## Eating Well

One of the best things about Beeper retreats is the awesome food that we get.

### Salsa

## Are We One Team?

During the retrospective meeting, Scott proposed the question "Are we one team?"
with the connotation of trying to identify if we see ourselves as a single team
with specializations in various areas, or as disparate teams at the same
organization. The Beeper team is still under 30 people and there are many large
companies where single teams are that size. Leading up to this retreat, I think
that culturally, we were one team: we all have a strong common goal and mandate
and we are all focused towards it.

However, I think there were some functional divides within the team. The biggest
divide was between "people who understood Matrix" and "people who cope with
Matrix". After this retreat, I think that divide has been bridged, and everyone
now has a working understanding of the underlying technology we are building
Beeper on.

The other divide was between client-side and server-side. During the retreat, I
think there was a shift towards understanding that we have control over the
entire stack. Our client devs don't have to treat the server as a black box that
can't be modified. If there are server changes that can make clients easier to
write, then we can make those changes. If they are generally applicable to
others, we can even contribute them to the Matrix Spec through the MSC process,
but developing things that work is our priority.

The retreat was a great opportunity to foster relationships across the team and
remember that we are all working towards the common goal of making the best damn
chat app in the world. We are at the beginning of something great and I'm
excited to see what we can accomplish as a team!
