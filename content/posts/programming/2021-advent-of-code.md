---
title: "Advent of Code 2021"
date: 2021-12-01T09:00:00-06:00
categories: [Programming]
tags: [Advent of Code, python, competition]
---

Every year since 2015, [Eric Wastl][1] creates a two-part programming problems
for each of the 25 days of Advent. He publishes a new problem every day at
[adventofcode.com](https://adventofcode.com) at exactly midnight EST which is
22:00 the day before for me in MST. Last year, I decided to do the problems as
soon as they came out and streamed my problem solving sessions on my [Twitch
channel][2] and upload them to [my Youtube channel][3]. This year, I'm going to
do the same thing!

I will update this post every day with my thoughts on each problem, and give a
brief solution sketch.

As with last year, I am participating in a private leaderboad for the Colorado
School of Mines CS department with a bunch of Mines students and alum.

[1]: https://twitter.com/ericwastl
[2]: https://twitch.tv/sumnerevans
[3]: https://www.youtube.com/channel/UCyrdRO4oJRpszr0ovN1FwBA

Summary of Results
==================

The following is my results across all of the days.

```
      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  2   00:03:03  1045      0   00:04:57   856      0
  1   00:00:49    38     63   00:02:22    66     35
```

Day 1: Sonar Sweep
==================

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **Link:** | https://adventofcode.com/2021/day/1 |
| **Solutions:** | [Python](https://github.com/sumnerevans/advent-of-code/blob/master/2021/01.py), [OCaml](https://github.com/sumnerevans/advent-of-code/blob/master/2021/01.ml) |
| **Part 1:** | 00:00:49, 38th |
| **Part 2:** | 00:02:22, 66th |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2021 - Day 1 | Python (38*, 66**)</summary>
  {{< youtube id="ieMpcBqqbqg" title="Advent of Code 2021 - Day 1 | Python (38*, 66**)" >}}
</details>

I did surprisingly well on this problem and I made the global leaderboard on
both parts. The core algorithm for both parts was a simple scan of a list where
you have to determine how many times the current element is greater than the
previous element.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

For part 1, you operate directly on the list. To do this, I used the
[`zip`](https://docs.python.org/3/library/functions.html#zip) function on the
sequence, and the sequence without the first element:

```python
for i, j in zip(seq, seq[1:]):
```

This iterates through all sequential pairs in the list. I then check to see if
``j > i`` and if so, increment a counter.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

Part 2 is very similar to part 1, but instead of operating directly on the list,
you operate on a new list consisting of the three-element sliding window sums of
the list. That is, you create a new list where the first element is the sum of
the three elements starting at index 0, the second element is the sum of the
three elements starting at index 1.

For example, if you have a list `[1, 2, 3, 4, 5]`, the resulting
sliding-window-sum list would be `[6, 9, 12]`. You don't have to start creating
sums until you have enough numbers.

To implement this, I used another `zip`, but this time with three elements, and
just summed each of the windows:

```python
windows = []
for i, j, k in zip(seq, seq[1:], seq[2:]):
    windows.append(i + j + k)
```

After calculating this list, the same algorithm as Part 1 works.

</details>

Day 2: Dive!
============

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **Link:** | https://adventofcode.com/2021/day/2 |
| **Solutions:** | [Python](https://github.com/sumnerevans/advent-of-code/blob/master/2021/02.py), [OCaml](https://github.com/sumnerevans/advent-of-code/blob/master/2021/02.ml) |
| **Part 1:** | 00:03:03, 1045th |
| **Part 2:** | 00:04:57, 856th |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2021 - Day 2 | Python (1045*, 856**)</summary>
  {{< youtube id="ZFZiaNXGq1Y" title="Advent of Code 2021 - Day 2 | Python (1045*, 856**)" >}}
</details>

This problem went well, almost got top 1000 on part 1, and got top 1000 on part
2. The problem is a basic state machine where you have to keep track of position
and (for part 2) "aim".

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

The only interesting thing that I did for part 1 is use a regular expression to
parse each line. Other than that, it was just a few `if` statements to determine
how to modify the `f` (forward) and `dep` (depth) variables. (You can read the
problem description on the AoC website for details on how you are supposed to
modify them.)

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

Part 2 is basically the same as part 1, except there is an additional variable
that you have to keep track of "aim" (`a`). This determines how "down" or "up"
your submarine is headed. The "up" and "down" commands no longer change your
actual position, but rather the aim, and forward changes your depth as well as
your lateral direction.

</details>
