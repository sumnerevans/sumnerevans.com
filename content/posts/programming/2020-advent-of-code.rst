---
title: "Advent of Code 2020: A Retrospective"
date: 2020-12-17T13:00:00-06:00
categories: [Programming]
tags: [Advent of Code, python, competition]
published: false
---

Every year since 2015, `Eric Wastl`_ creates a two-part programming problems for
each of the 25 days of Advent [1]_. He publishes a new problem every day at
`adventofcode.com <https://adventofcode.com_>`_ at exactly midnight EST which is
22:00 the day before for me in MST. This year, for the first time, I decided to
do the problems as soon as they came out and stream my solve sessions on `my
Twitch channel <twitch_>`_ and subsequently `upload them to my YouTube channel
<youtube_>`_.

.. TODO:

This is the first year for which I completed all of the problems. In previous
years, I solved some of the problems, but after some number of days my
motivation dipped and I no longer wanted to solve any more problems. This year,
I had some external motivation to keep me going: I was participating in a
private leaderboad for the Colorado School of Mines CS department with a bunch
of Mines students and alum. I ended up TODOth place.

.. TODO

Other people who solved all of the problems include TODO

Problem Summaries
=================

Below is list of my leaderboard placements (in parentheses, first number is
leaderboard placement for part 1, second number is leaderboard placement for
part 2), a short summary of the key idea behind each problem, how the solve
process went for me for each problem, and a link to the VOD on YouTube.

1. **(1134/945)** The key idea for Day 1 was to use doubly (for part 1) and
   tripply (for part 2) nested ``for`` loops to check all pairs / triplets
   within a sequence of numbers. Overall, this day went well for me although due
   to the issue with the site going down, this day didn't count. `Day 1 YouTube
   VOD`_.

2. **(609/554)** The key idea of this problem was counting the occurrences of a
   letter within a string. There was some slight parsing involved, but nothing
   too complicated.

..       -------Part 1--------   -------Part 2--------
.. Day       Time  Rank  Score       Time  Rank  Score
..  18   00:26:27  1225      0   00:43:41  1219      0
..  17   00:53:00  2348      0   00:56:46  2006      0
..  16   00:10:02   399      0   00:26:58   254      0
..  15   00:13:56  1055      0   00:15:28   464      0
..  14   00:23:12  1982      0   00:43:30  1388      0
..  13   00:06:21   573      0   03:50:06  5233      0
..  12   00:09:49   775      0   00:39:10  2405      0
..  11   00:28:55  2173      0   01:05:09  3183      0
..  10   00:07:25  1095      0   00:19:54   708      0
..   9   00:04:03   227      0   00:07:33   168      0
..   8   00:09:07  1923      0   00:12:57   580      0
..   7   00:12:51   360      0   00:27:50   830      0
..   6   00:03:39   438      0   00:07:41   558      0
..   5   00:10:35  1359      0   00:22:43  2656      0
..   4   00:15:09  2854      0   00:30:14  1294      0
..   3   00:08:47  1930      0   00:18:05  2689      0
..   2   00:04:43   609      0   00:07:35   554      0
..   1   00:08:00  1134      0   00:09:30   945      0


Like, think about it like this: here's a short description of the core idea
behind each of these problems (and if applicable the class where the idea is
taught at Mines, ignoring 101 because it's not a prereq for anything except
graduation) (this will end up in a blog post probably lol)

1 - double and tripple nested for loops (261/262)
2 - input parsing and counting occurrences in a string (261)
3 - modular arithmetic + very simple simulation (261/262)
4 - nontrivial data parsing + input verification (262)
5 - binary search or identifying that it's a bitmap (341)
6 - using a set (261)
7 - annoying input parsing + trees (262/406)
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

Yes, a lot of these are 262, but to be honest, most people who have taken 262
would have trouble identifying the correct data structure to use for the
problems. (Source: I TA'd 262 for a year.) Hell, a lot of people in that class
who showed up for office hours couldn't even get syntax for for loops right.


.. _Day 1 YouTube VOD: https://youtu.be/8Ufl86KHwuI

.. _Eric Wastl: https://twitter.com/ericwastl
.. _twitch: https://twitch.tv/sumnerevans
.. _youtube: https://www.youtube.com/channel/UCyrdRO4oJRpszr0ovN1FwBA

.. [1] Really, it's not the traditional Advent. Traditional Advent started on
       November 29th this year since that was the fourth Sunday before
       Christmas.
