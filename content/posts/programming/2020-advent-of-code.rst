---
title: "Advent of Code 2020: A Retrospective"
date: 2020-12-17T13:00:00-06:00
categories: [Programming]
tags: [Advent of Code, python, competition]
draft: true
---

Every year since 2015, `Eric Wastl`_ creates a two-part programming problems for
each of the 25 days of Advent [1]_. He publishes a new problem every day at
`adventofcode.com <https://adventofcode.com_>`_ at exactly midnight EST which is
22:00 the day before for me in MST. This year, for the first time, I decided to
do the problems as soon as they came out and stream my problem solving sessions
on `my Twitch channel <twitch_>`_ and subsequently `upload them to my YouTube
channel <youtube_>`_.

This is the first year for which I completed all of the problems. In previous
years, I solved some of the problems, but after some number of days my
motivation dipped and I no longer wanted to solve any more problems. This year,
I had some external motivation to keep me going: I was participating in a
private leaderboad for the Colorado School of Mines CS department with a bunch
of Mines students and alum. I ended up fourth place on that leaderboard
(slightly disappointing, more on that later).

Summary of Results
==================

The following were my results across all of the days.

::

          -------Part 1--------   -------Part 2--------
    Day       Time  Rank  Score       Time  Rank  Score
     25   00:57:18  3173      0   00:57:21  2555      0
     24   00:20:23  1084      0   00:40:55  1049      0
     23   00:22:30   613      0   02:26:58  1792      0
     22   00:06:49   439      0   00:33:54   573      0
     21   00:37:49  1489      0   00:58:18  1837      0
     20   04:32:46  4269      0   06:01:56  1760      0
     19   01:03:50  1931      0   05:58:15  4038      0
     18   00:26:27  1225      0   00:43:41  1219      0
     17   00:53:00  2348      0   00:56:46  2006      0
     16   00:10:02   399      0   00:26:58   254      0
     15   00:13:56  1055      0   00:15:28   464      0
     14   00:23:12  1982      0   00:43:30  1388      0
     13   00:06:21   573      0   03:50:06  5233      0
     12   00:09:49   775      0   00:39:10  2405      0
     11   00:28:55  2173      0   01:05:09  3183      0
     10   00:07:25  1095      0   00:19:54   708      0
      9   00:04:03   227      0   00:07:33   168      0
      8   00:09:07  1923      0   00:12:57   580      0
      7   00:12:51   360      0   00:27:50   830      0
      6   00:03:39   438      0   00:07:41   558      0
      5   00:10:35  1359      0   00:22:43  2656      0
      4   00:15:09  2854      0   00:30:14  1294      0
      3   00:08:47  1930      0   00:18:05  2689      0
      2   00:04:43   609      0   00:07:35   554      0
      1   00:08:00  1134      0   00:09:30   945      0

A few highlights for me on the global leaderboard include the following (numbers
reported as part 1/part 2):

* Top 1000 days: 9/10
* Best day overall: 226/168 (day 9)
* Best day per part: 227/168 (day 9/day 9)
* Worst day overall: 4269/1760 (day 20)
* Worst day per part: 4269/5233 (day 20/day 13)
* Fastest solve per part: 03:39/07:33 (day 6/day 9)
* Longest solve per part: 04:32:46/06:01:56 (day 20/day 20)
* Average global leaderboard placement per part: 1418.28/1629.52

Other people on the Mines leaderboard who solved all of the problems are `Colin
Siles`_, McPqndq_, `Easton Bornemeier`_, `Keshav Vembar`_, johntaylor1309,
`Jackson Garner`_, Andrew, (anonymous user #134619), and `Adam Sandstedt`_.

A few highlights for me on the Mines leaderboard include the following (numbers
reported as part 1/part 2):

* Top 3 days: 11/10

  * Firsts: 2/3
  * Seconds: 5/3
  * Thirds: 4/4

* Best day overall: 1/1 (day 9)
* Worst day overall: 2/10 (day 13)
* Best recovery: 10/1 (day 4)
* Average leaderboard placement per part: 4.36/4.2

.. _Colin Siles: https://github.com/sColin16
.. _McPqndq: https://github.com/mcbobby123
.. _Easton Bornemeier: https://github.com/erbornemeier
.. _Keshav Vembar: https://github.com/kvembar
.. _Jackson Garner: https://github.com/jhgarner
.. _Adam Sandstedt: https://github.com/AdamSandstedt

.. TODO

A few things I learned:

* Template
* I suck at grids
* My math skills are ass
* I'm bad at cellular automata
* We've got some really good competitive programmers at Mines

My Favorite Problems
====================

My favorite problem overall was day 20. It was a very fun and rewarding problem.

Problem Summaries
=================

Below is list of my leaderboard placements (in the parentheses, the first and
second numbers are my placement on the global leaderboard for parts 1 and 2,
respectively, while the third and fourth numbers are my placement on the Mines
private leaderboad for parts 1 and 2, respectively), a short summary of the key
idea behind each problem, how the solve process went for me for each problem,
and a link to the VOD on YouTube.

1. **(1134/945, 2/2)** Day 1 required the use of use doubly (for part 1) and
   triply (for part 2) nested ``for`` loops to check all pairs / triplets within
   a sequence of numbers. Overall, this day went well for me although due to the
   issue with the site going down, this day didn't count. `Day 1 VOD on
   YouTube`_.

2. **(609/554, 3/3)** The key idea for Day 2 was counting the occurrences of a
   letter within a string. There was some slight parsing involved, but nothing
   too complicated. I should have scored better, but I failed to fully
   understand the problem (which you will see is a common theme). `Day 2 VOD on
   YouTube`_.

3. **(1930/2689, 6/7)** For Day 3, the key insight is to use modular arithmetic
   for wrap-around on an infinitely-tiled 2D grid. I again failed to fully
   understand the problem, and so I solved the wrong one and had to debug. I
   also typoed ``dx`` as ``dy``. `Day 3 VOD on YouTube`_.

4. **(2854/1294, 10/1)** This problem was an input verification problem. For
   part 1, it's basically a set-existence problem, whereas for part 2, it
   requires some more complicated verification. I used regular expressions, and
   I was bit by the fact that ``re.match`` in Python doesn't match the whole
   string, but I still managed a comeback win on Part 2. `Day 4 VOD on
   YouTube`_.

5. **(1359/2656, 4/8)** Part 1 of Day 5 is trivial to solve if you have the key
   insight that what is being described is a binary number representing your
   seat ID. Unfortunately, I did not have that insight, and instead implemented
   it as a binary search (which did work, but was *significantly* slower to
   implement than necessary, so I lost a ton of leaderboad points). To add
   insult to injury, I had trouble figuring out what Part 2 was telling me to
   do which lost me even more time. `Day 5 VOD on YouTube`_.

6. **(438/448, 3/3)** This problem was another input verification problem. The
   first part was counting the *union* of each group's responses and the second
   part was counting the *intersection* of each group's responses. My
   implementation was pretty messy, but it was actually pretty reasonable as far
   as implementation time. Still only got 3rd on the private leaderboard. `Day 6
   VOD on YouTube`_.

7. **(360/830, 1/4)** This problem was a tree problem involving counting the
   number of child (part 1) and parent (part 2) nodes of a specific node. It
   also involved some annoying input parsing (knowing regex really helped me
   here). Part 1 was pretty good, but I really faltered on part 2 (common
   theme). I tried to be too "cute" instead of doing the easy thing of creating
   a new tree for solving part 2. `Day 7 VOD on YouTube`_.

8. **(1923/580, 5/3)** This problem involved implementing a simple emulator for
   a very simple "assembly" language. TODO `Day 8 VOD on YouTube`_.

9. **(227/168, 1/1)** TODO `Day 9 VOD on YouTube`_.
10. **(1095/708, 5/4)** TODO `Day 10 VOD on YouTube`_.
11. **(2173/3183, 5/7)** TODO `Day 11 VOD on YouTube`_.
12. **(775/2405, 3/7)** TODO `Day 12 VOD on YouTube`_.
13. **(573/5233, 2/10)** TODO `Day 13 VOD on YouTube`_.
14. **(1982/1388, 8/5)** TODO `Day 14 VOD on YouTube`_.
15. **(1055/464, 5/2)** TODO `Day 15 VOD on YouTube`_.
16. **(399/254, 2/1)** TODO `Day 16 VOD on YouTube`_.
17. **(2348/2006, 5/5)** TODO `Day 17 VOD on YouTube`_.
18. **(1225/1219, 2/2)** TODO `Day 18 VOD on YouTube`_.
19. **(1931/4038, 5/4)** TODO `Day 19 VOD on YouTube`_.
20. **(4269/1760, 8/4)** TODO `Day 20 VOD on YouTube`_.
21. **(1489/1837, 6/5)** TODO `Day 21 VOD on YouTube`_.
22. **(439/573, 3/4)** TODO `Day 22 VOD on YouTube`_.
23. **(613/1792, 2/4)** TODO `Day 23 VOD on YouTube`_.
24. **(1084/1049, 5/3)** TODO `Day 24 VOD on YouTube`_.
25. **(3173/2555, 8/6)** TODO `Day 25 VOD on YouTube`_.

8 - having a general idea of how a processor works (341)
9 - sliding window (262 I guess?, but not really taught explicitly)
10 - it's a DAG (406) or it's crazy math (discrete math theoretically, but not in actuality)
11 - cellular automata (262 I guess?, but not really ever taught explicitly)
12 - very annoying state machine (262 I guess?, but not really ever taught explicitly)
13 - math (discrete math, but not really)
14 - binary numbers (341) or string manipulation (262?)
15 - state machine (262 kinda)
16 - nontrivial input parsing + input verification + nontrivial inferences (discrete + 262?)
17 - cellular automata in even more dimensions (262 I guess?, but not really ever taught explicitly)
18 - a calculator with different rules for associativity
19 - regex grossness
20 - sea monsters
21 - inferences
22 - recursive war
23 - linked list
24 - hexagonal grid
25 - Diffie-Hellman

.. _Day 1 VOD on YouTube: https://youtu.be/8Ufl86KHwuI
.. _Day 2 VOD on YouTube: https://youtu.be/Pwf2wb8tsaw
.. _Day 3 VOD on YouTube: https://youtu.be/D9XCB_m-GuA
.. _Day 4 VOD on YouTube: https://youtu.be/0idtcGxpPfw
.. _Day 5 VOD on YouTube: https://youtu.be/M41frXqyqm8
.. _Day 6 VOD on YouTube: https://youtu.be/8lDqlXydco4
.. _Day 7 VOD on YouTube: https://youtu.be/ejR-IpbELBE
.. _Day 8 VOD on YouTube: https://youtu.be/EzF7JNB7ISA
.. _Day 9 VOD on YouTube: https://youtu.be/6V1mV5wz1Ms
.. _Day 10 VOD on YouTube: https://youtu.be/7TFQsvCxCIU
.. _Day 11 VOD on YouTube: https://youtu.be/I4aIVh7JLkU
.. _Day 12 VOD on YouTube: https://youtu.be/UryFzQPgx1o
.. _Day 13 VOD on YouTube: https://youtu.be/OV3e3l3LKow
.. _Day 14 VOD on YouTube: https://youtu.be/KDXdNYr-GVE
.. _Day 15 VOD on YouTube: https://youtu.be/MyCjuvWL2xk
.. _Day 16 VOD on YouTube: https://youtu.be/kG_dMdgxU_I
.. _Day 17 VOD on YouTube: https://youtu.be/Mjd6CWwxHzw
.. _Day 18 VOD on YouTube: https://youtu.be/LahmCoZCWOk
.. _Day 19 VOD on YouTube: https://youtu.be/lo9huRNT_7w
.. _Day 20 VOD on YouTube: https://youtu.be/6Hff1j9tNwI
.. _Day 21 VOD on YouTube: https://youtu.be/45KAlQk5gjM
.. _Day 22 VOD on YouTube: https://youtu.be/GmePVJCRhjc
.. _Day 23 VOD on YouTube: https://youtu.be/WOWQXzZzc3U
.. _Day 24 VOD on YouTube: https://youtu.be/wJaF9oMZwrs
.. _Day 25 VOD on YouTube: https://youtu.be/C1_LIZC0SHU

.. _Eric Wastl: https://twitter.com/ericwastl
.. _twitch: https://twitch.tv/sumnerevans
.. _youtube: https://www.youtube.com/channel/UCyrdRO4oJRpszr0ovN1FwBA

.. [1] Really, it's not the traditional Advent. Traditional Advent started on
       November 29th this year since that was the fourth Sunday before
       Christmas.
