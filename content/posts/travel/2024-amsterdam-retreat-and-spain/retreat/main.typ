// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Amsterdam, Netherlands - Work Retreat",
  description: "This week, Beeper (now part of Automattic) had a week-long work retreat in\nAmsterdam, Netherlands. These are my thoughts and reflections on the trip.\n",
  date: datetime(year: 2024, month: 11, day: 8),
  extra: (
    categories: ("Travel", "Trip to Amsterdam and Spain 2024", "Work Retreats"),
    tags: ("Travel", "Amsterdam", "Netherlands", "Beeper", "Automattic", "Work"),
    image: "images/team.jpg",
    build: (
      publishResources: false,
    ),
  ),
)
#show: dir-template

This week, Beeper had our second meetup after being
#link("https://blog.beeper.com/2024/04/09/beeper-is-joining-automattic/")[acquired by Automattic]
earlier this year. Unlike the
#link("https://sumnerevans.com../../2024-porto-retreat/retreat/index.md")[last retreat in Porto]
which had lots of other Automattic employees in attendance, this was just our
team and was focused on work and planning less than team-building.

Automattic is a #link("https://automattic.com/about")[remote-only company], so work
retreats are the only time that we can connect with our co-workers in-person and
build stronger personal relationships among the team. The best part is that we
get to go to cool locations for these meetups. You can read about all the
previous #link("https://sumnerevans.com/categories/work-retreats/")[work retreats on this blog].

For this retreat, we returned to
#link("https://goo.gl/maps/DeqBLLtmbuR9Ne8Y6")[The Social Hub Amsterdam City] which was
one of the best retreat locations in my opinion. We had a co-working/conference
room to ourselves.



== Vision and Execution <posts-travel-2024-amsterdam-retreat-and-spain-retreat-vision-and-execution>

During the first day of the retreat, Brad and Kishan talked about the technical
and product visions for Beeper next year and beyond. At the highest level, our
goal is to make the best chat app. To accomplish that, we need to build a lot
more features to gain parity with the existing chat apps. We need to finish our
transition to local bridges, we need to improve the reliability and speed of our
backend infrastructure, make our clients faster and more native-feeling, and
much more.



In order to execute our lofty goals, we have to work together effectively as a
team. One of the team leads, Matt Wondra, led a discussion about working norms
and expectations which was quite unifying as we all agreed on the overall
expectations, and the only discussion points were tactical in nature.

== Telegramming <posts-travel-2024-amsterdam-retreat-and-spain-retreat-telegramming>

The main thing I worked on was the Telegram bridge. I've been rewriting it in Go
since the last retreat and we released the new bridge to all users a few weeks
ago. However, there has unfortunately been a very long tail of bugs that have
caused users to experience edge cases that we didn't detect during our internal
testing.

I took advantage of having #link("https://mau.fi")[Tulir] right next to me to discuss
and fix some of the most prevalent bugs, but there is still more work to do.

== The Server's on Fire <posts-travel-2024-amsterdam-retreat-and-spain-retreat-the-servers-on-fire>

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

== Localling All of the Bridges <posts-travel-2024-amsterdam-retreat-and-spain-retreat-localling-all-of-the-bridges>

As announced in our
#link("https://blog.beeper.com/2024/04/09/how-beeper-android-works/")[How Beeper Android Works]
blog post earlier this year, we are working to run bridges within the client.
This was the impetus behind rewriting all of the bridges in Go using a common
bridge framework so that we can integrate them into the clients.

During the retreat, there was lots of cross-team collaboration and testing to
work out the interface details between bridges and clients. I was not involved
in this, but it was neat to see all of the cross-team collaboration.

== Rematch! <posts-travel-2024-amsterdam-retreat-and-spain-retreat-rematch>

At the
#link("https://sumnerevans.com../../2023-amsterdam-retreat/retreat/index.md#i-can-play-the-nine-ball")[last Amsterdam retreat]
one of the highlights was playing pool with the team. We of course had to have a
rematch. Tulir and Toni beat me and Nick twice! I guess we will have to return
for yet another rematch!



#html.hr()

Overall, this retreat was a productive and encouraging one. I'm excited about
the plans we have for the future, and I am encouraged by how well the team works
together. I was happy to get to work in-person with my team, and discuss how we
are going to improve our oncall experience moving forward.
