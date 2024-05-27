---
title: "Ericeira, Portugal - Work Retreat"
date: 2022-06-10T12:00:00-06:00
categories: [Trip to Portugal and France, Work Retreats]
tags: [Travel, Ericeira, Portugal, Beeper, Work]
description: "My thoughts and reflections on the Beeper Summer 2022 retreat in Ericeira, Portugal."
image: images/tent.jpg
---

I spent the first week of my trip at a Beeper company retreat in Ericeira,
Portugal: a town about an hour northwest of Lisbon. We were staying at an event
venue called Alma do Paço. The goal of all of the work retreats is to allow the
team to have a week of focused collaboration. We tried to take advantage of
having all of the teams together by working on some cross-team projects. We also
try to have whole-team meetings such as retrospectives, planning and
brainstorming discussions, and other meetings. The retreats are also our main
opportunity to meet coworkers in-person and are great times to build
relationships. I find that meeting people in person is extremely helpful for
making the online interactions feel personal.

I'd met most of the people who attended this retreat at either the
[Montreal retreat]({{< ref "../../2021-dc-montreal/2021-09-13-17-montreal/index.rst" >}})
or the
[Mexico retreat]({{< ref "../../2022-playa-del-carmen-mexico/index.md" >}}),
but there were four teammates who I hadn't met before: Brandon, an iOS developer
(and my roommate for the week); Samer, a support agent; Toni, an infrastructure
developer; and Ivan, our product designer.

At one point during the retreat someone commented that the group was so cohesive
and friendly that they had a hard time remembering who they had not met in
person. I think that is just a testament to the effectiveness of our remote
culture.

## The Venue

The location of our retreat was beautiful. Alma do Paço is just outside of the
town of Santo Isidoro and is often used for weddings. It is built within the
ruins of a fourteenth century royal summer home. The views were great, and the
beach was a 30 minutes walk away.

{{< figure
      src="./images/view-1.jpg"
      link="./images/view-1.jpg"
      target="_blank"
      title="The view over the countryside from our retreat venue"
      caption="We were out in the country, and the views were spectacular."
>}}

{{< figure
      src="../denver-to-lisbon/images/beach.jpg"
      link="../denver-to-lisbon/images/beach.jpg"
      target="_blank"
      title="The beach near our retreat venue"
      caption="A few of us went [on Sunday](../denver-to-lisbon) and at other points during the week. I went again on Wednesday and on Friday."
>}}

Our workspace for the week was almost entirely outdoors. We spent a lot of time
under the open-air tent that was set up outside. The area around the firepit was
also nice when there was some shade. The small chapel area was covered, but
there was only a small (fairly ineffective) mobile air conditioning unit which
made the space difficult to use during the hottest parts of the day.

{{< figure 
      src="./images/tent.jpg"
      link="./images/tent.jpg"
      target="_blank"
      title="The team listening to Eric lay out the company vision"
      caption="We used the tent for all of our main team meetings."
>}}

### Our Hosts

The Alma do Paço hosts were on-site helping accommodate us every day. The main
host: Chaplain (I think he's the owner of the property) is an Australian, and
Carolien (not to be confused with the Caroline at Beeper) is native Portuguese.

The primary thing they did was provide food for us every day (except for a few
meals which we had at offsite locations). Breakfast was always an array of bread
and a variety of jams and other spreads along with cheese and prosciutto. Lunch
and dinner featured a variety of meals from some vegetarian meals, to seafood.
They were all quite good, but we often did not have enough. For quite a few
meals, we ran out of food too quickly which was very unfortunate.

## Work, But Not Too Hard

Since it was a work trip, we did have to do *some* work. However, we focused on
more collaborative full-company or cross-team meetings and projects.

### Retro!

In what seems to be the standing tradition at the retreats, we had a
retrospective meeting on Monday morning to kick off the week. At the retro,
everyone had a few minutes to write sticky notes covering five categories: what
is going well, what is not going well, ideas for things we should be doing,
outstanding questions, and shoutouts. Then, everyone took turns reading their
sticky notes and people were free to make small additional comments. The
"shoutouts" category was new for this retreat and consisted of mentioning people
who had made a noticeable impact that you wanted to recognize. For example, one
of mine was for our support team. They work to inform users about how to use the
product and also help smooth over any service disruptions or bugs that users run
into. They also work to inform the engineering team about what issues users are
facing.

{{< figure 
      src="./images/retro.jpg"
      link="./images/retro.jpg"
      target="_blank"
      title="The team participating in the retrospective meeting"
      caption="Caroline (standing left) is discussing her retro sticky notes as Brad (standing right) looks on."
>}}

### On Mission

On Tuesday, Eric laid out the company vision and how it relates to our short,
medium, and long term plans. He has done this every retreat, and while overall
the same, each time a few more ideas come into focus and I am finding it easier
to see how what we are working on currently aligns with the very ambitious goal
that we have to "build the best damn chat app". One of the new things this time
was the unveiling of our mission statement: *make it easy for everyone on Earth
to chat with each other*.

### Discuss and Plan

Other meetings included an hour or so on Monday discussing what we could build
for the support team to help them improve their processes. Out of that, a few
action items arose, some of which ended up being worked on during the retreat.
Additionally on Monday afternoon, each of the engineering teams had a tooling
planning session. My team (Scott, Eric Rabil, Tulir, and myself) spent a lot of
ours by walking around the neighborhood talking about things that we wanted to
make easier for ourselves such as improving our deployment queue functionality
and consolidating more logic in shared libraries.

We also had a security brainstorming meeting on Tuesday led by Brad to discuss
what we could do to harden the security of the platform. After that we also had
a discussion about database reliability and how to ensure that bridges (the
services which connect Beeper to the external networks) reliably reconnect in
the case of temporary database outages (an issue that we have been running into
more recently due to the large number of upgrades happening to the database
layer of our platform).

On Wednesday, we had a meeting to discuss how to scale the platform. One of the
main things that we discussed as a potential option is to create a specialized
server for non-federated bridge traffic. This is a project that myself and Toni
had started working on a bit already and we discussed ways to try and test it
out and eventually get it into production as well as possible alternative
approaches. The project is called *hungryserv* since it's for **unfed**erated
traffic.

### Writing Some Code

Monday and Tuesday and some of Wednesday were (I think intentionally) very
meeting heavy and the meetings were a great way to make sure everyone was
aligned. In the back half of the week, we focused on cross-team initiatives and
other collaborative projects.

I spent most of my time working on hungryserv (the unfederated Matrix homeserver
proof of concept that I mentioned earlier). Toni worked on roomserv which is
another component that will be needed to help scale. My goal was to get
hungryserv to the point where you could run a simple bridge against it.
Throughout the process, I relied heavily on Tulir's expertise with the spec and
how all of the endpoints work. I didn't quite get there by the end of the week,
but I got very close.

At one point, Ian asked me for some help compiling a project that he built on
Linux (he wasn't able to cross compile it from his Mac due to dynamic linking).
We ended up setting up an automated GitHub action so that the build process
could happen automatically on all relevant platforms. Ian hadn't used GitHub
Actions before, so I was able to help advise with some of my experience with it.
It was a neat collaboration with someone that I don't normally have any context
to collaborate with (Ian is on the iOS team currently, so we don't interact
often day-to-day).

I also paired with Rabil to finish up proper bridging of link previews from
iMessage to Beeper. This feature allows, iMessage users to see a nice preview of
the link in the message sent from Beeper and vice versa. All of the other
bridges have had this for a while, but iMessage had some specific challenges
that made it more difficult, and was best done when we could each quickly ask
questions of one another while staring at each other's code.

{{< figure 
      src="./images/code-by-the-fire.jpg"
      link="./images/code-by-the-fire.jpg"
      target="_blank"
      title="Sumner, Eric Rabil, and Tulir coding while sitting near the fire"
      caption="I'm pretty sure we were putting the finishing touches on iMessage link previews here."
>}}


One of the major cross-team initiatives for the week was message send status
indicators which will help inform users when errors happen while bridging their
messages to other platforms. Scott led a mini "hackathon" and facilitated many
discussions and test sessions to ensure that the way that we were handling it is
consistent across all of the apps, makes sense to the users, and also has as few
edge cases as possible. I didn't participate much in the hackathon, but I did
contribute in a small way by writing a bit of bridge "mock" code (code that
emulates what a real bridge would do) to help the client teams test their
functionality.

## Chatwoot! (And Other Shenanigans)

We got a lot of things done during the retreat, but we also got into a lot of
shenanigans as well.

At one point, Gerardo mentioned that he had noticed that I seem to be very quick
to read messages whenever Chatwoot is being discussed. This is true since I set
up "Chatwoot" as one of the keywords that I have notify me noisily (and break
through any other chat muting that I have). The reason for this is that I wrote
the Chatwoot bot that the support team uses and so I added it as a keyword so
that I would be notified any time that people had problems with the bot. Well,
everyone started typing Chatwoot in our various chats all the time just to
notify me. Throughout the week, "chatwoot" would appear in random chats at
random hours of the day which was amusing and became the de-facto motto for the
retreat.

Funnily enough, one of the small projects I worked on during the week was an
addition to the Chatwoot bot and I had to deploy a new version of the bot a few
times. Unfortunately, the bot isn't in our continuous deployment system, so it
has to be upgraded manually. Hence, Nick (one of the members of the
infrastructure team) became my CD system for the day. For a few hours, every
time I walked over to him it would be so that he could deploy a new hash to
production. After a few times, every time I'd come over he'd see me and ask what
I'd broken that time. Even the next day when I came over to talk to Nick, his
first question was "what hash do I need to deploy?" and "what have you done this
time?" :)

Alma do Paço has a large fire pit within the ruins area and every evening we
started a fire and sat around talking and drinking until late into the evening.
Adam was always the one who started the fire in the evening and so we promoted
him to the C-suite as our CFO (Chief Fire Officer). Luckily, Scott who was
dubbed as our Chief Safety Officer after leading us safely back to the Airbnb
[during the last retreat]({{<ref "../../2022-playa-del-carmen-mexico/index.md#getting-to-know-my-coworkers" >}})
was there to oversee and approve the fire.

The nightly bonfires were great team bonding times and I think a couple of good
ideas came out of discussions around the fire, however, the most of the ideas
were probably horrible and mainly inspired by the alcohol. One evening, we
played a game that was some twisted combination of charades and taboo that was
very fun and got everyone doing ridiculous motions and saying ridiculous things
to get their team to guess the words in a deck of cards. Another time, Scott
told a "story" about the barwich: an ice cream sandwich on bottom combined with
an ice cream bar on top. He told this elaborate story about how he'd seen them
in Japan years ago, but hadn't seen them again... until a store in Portugal! On
Monday, we had s'mores around the fire and it was the first time that some of
the non-North-American team members had had a s'more! These were very fancy
s'mores, though: they were chocolate covered marshmallows so you had to be very
careful to not melt the chocolate off the marshmallow. We also had very tiny
sticks and which made roasting the marshmallows a quite warming experience.

{{< figure 
      src="./images/fire.jpg"
      link="./images/fire.jpg"
      target="_blank"
      title="Getting ready to play a game around the fire one evening"
      caption="We got to learn a lot about each other around the fire pit and it was a really fun time each evening."
>}}

## Activities 

We clearly managed to make up our own fun, but there were also some planned
team activities throughout the week as well.

### Getting In Shape

On Tuesday, we went on a mountain biking tour. It wasn't super intense compared
to mountain biking back home in Colorado since it was mainly just around the
hills in the area, but I'm not a mountain biker so it was novel and a bit
challenging for me. The views were spectacular. We stopped at many overlooks,
including this one where we took a team picture:

{{< figure 
      src="./images/biking-team.jpg"
      link="./images/biking-team.jpg"
      target="_blank"
      title="The team in front of a scenic cliff overlook during our biking tour"
      caption="The views were spectacular during the entire ride, but the company was even better!"
>}}

The weather was fantastic for the ride, which made it very enjoyable, but we
definitely got our exercise!

{{< figure 
      src="./images/biking-road.jpg"
      link="./images/biking-road.jpg"
      target="_blank"
      title="Biking along the road back towards our retreat location"
      caption="We spent time on both trails and roads during our ride. It was all very scenic."
>}}

### Beach Time

I made a few trips down to the beach:
[on Sunday when I arrived]({{<ref "../denver-to-lisbon/index.md" >}}),
on Wednesday with Scott, Finn, and Nick, and on Friday with a lot more of the
team. I got into the water on Sunday and on Friday. It was much warmer on Sunday
and while cold, it was refreshing. The tide was also high, so the rocks which
protect much of the beach from the large waves were effective, but still
submerged enough that you could swim over them.

On Friday, it was a different story entirely: it was very cold, and the tide was
low so the rocks were exposed making walking out to open water difficult in that
area. There was another area which was exposed more directly to the ocean
without a rock barrier. Some of us walked over to that area and tried out the
water, but we didn't go too far in because the rip tide was very strong with the
large waves crashing onto the beach and receding back to the ocean. The water
was very cold as well, so we didn't stay long in the water.

### Thursday Event

On Thursday, we went on a bus tour to Óbidos (a mediaeval town), Fátima (a
Catholic church built on the location where Mary is said to have appeared to
three children), and Nazaré, a town known for its surfing and is massive waves.

Our guide didn't give as much commentary as I would have hoped, but I'll show
you some pictures of each location.

{{< figure 
      src="./images/obidos.jpg"
      link="./images/obidos.jpg"
      target="_blank"
      title="A panoramic shot taken from the top of the wall around Óbidos"
>}}

{{< figure 
      src="./images/fatima.jpg"
      link="./images/fatima.jpg"
      target="_blank"
      title="The main square at the church at Fátima"
      caption="On the left is a shrine where Catholics make pilgrimages to light candles and such. The square is modeled very similar to the square in the Vatican and has been visited by the Pope multiple times."
>}}

{{< figure 
      src="./images/nazare.jpg"
      link="./images/nazare.jpg"
      target="_blank"
      title="The coast of Nazaré"
      caption="There were no big waves the day that we was there, but apparently, the waves get very big. A surfer recently surfed a wave that was 26.21 metres (86 feet) high!"
>}}

During the tour, we stopped at a seafood restaurant and Caroline, Rabil, and
myself shared a dish with freshly baked fish, potatoes, and vegetables.

{{< figure 
      src="./images/fish-lunch.jpg"
      link="./images/fish-lunch.jpg"
      target="_blank"
      title="The waiter presenting the freshly caught fish"
      caption="The fish was very fresh, caught that morning I assume."
>}}

### Dinner by the Seaside

After the tour, we went back to Alma do Paço for a few hours and then headed to
a dinner at a seaside restaurant.

The food was quite good, but the view was amazing.

{{< figure 
      src="./images/dinner-thursday.jpg"
      link="./images/dinner-thursday.jpg"
      target="_blank"
      title="The team eating dinner on Thursday"
      caption="The sunset was a beautiful to our meal."
>}}

## Conclusion

I always enjoy the retreats; they are great times to bond with the team,
collaborate in person, and bring everything that we work on day-to-day into
perspective.

It was a pleasure meeting some new co-workers, and I enjoyed continuing getting
to know the ones that I'd already met a bit better. I'm looking forward to the
next retreat and I'm excited to be a part of what Beeper is going to accomplish
in the future!
