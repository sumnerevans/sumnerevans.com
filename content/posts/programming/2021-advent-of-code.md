---
title: "Advent of Code 2021"
date: 2021-12-01T09:00:00-06:00
categories: [Programming]
tags: [Advent of Code, python, competition]
---

Every year since 2015, [Eric Wastl][1] creates a two-part programming problem
for each of the 25 days of Advent. He publishes a new problem every day at
[adventofcode.com](https://adventofcode.com) at exactly midnight EST which is
22:00 the day before for me in MST. Last year, I decided to do the problems as
soon as they came out and streamed my problem solving sessions on my [Twitch
channel][2] and uploaded them to [my Youtube channel][3].

This year, I'm doing to do the same thing! This year, however, I'm also going to
maintain this blog post. I will update this post every day with my thoughts on
each problem, and give a brief solution sketch.

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
  3   00:06:56  1338      0   00:38:16  3718      0
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

Day 3: Binary Diagnostic
========================

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **Link:** | https://adventofcode.com/2021/day/3 |
| **Solutions:** | [Python](https://github.com/sumnerevans/advent-of-code/blob/master/2021/03.py) |
| **Part 1:** | 00:06:56, 1338th |
| **Part 2:** | 00:38:16, 3718th |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2021 - Day 3 | Python (1338*, 3718**)</summary>
  {{< youtube id="xVgcF0uBOWM" title="Advent of Code 2021 - Day 3 | Python (1338*, 3718**)" >}}
</details>

Part 1 of this problem went fairly well, but part 2 was a disaster. One thing
that I think helped with both parts was keeping the input as a string and
operating on the individual characters, because thinking through the actual
bitwise operations sounded difficult.

Overall, this problem was more interesting than Day 2, and I enjoyed refactoring
at the end. I think that I should have taken a couple more minutes at the start
of part 2 to think about how to best implement it. I think that would have
allowed me to avoid a couple foot-guns.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

To calculate "gamma", you have to determine, for each column of the input what
the most common bit is (`1` or `0`) and that most common bit becomes that
column's value in the bit representation of "gamma". Epsilon is just the
complement of gamma (that is, reverse all the `1`s and `0`s).

To do this, I created two lists, one to keep track of how many `1`s were present
in each column of the input, and another to track how many `0`s were present in
each column of the input. Then, I `zip`ped the lists together so that I could
compare whether there were more `1`s or `0`s at each column.

During the stream, I just used a `for` loop to accomplish this, but afterwards I
converted it to a fairly nice list comprehension:

```python
# Store the bitmap as a list of integers. If there are more zeros than ones, then
# that index is 0, otherwise, that index should be 1.
gamma = [0 if zeros > ones else 1 for zeros, ones in zip(freq0, freq1)]
```

Obviously it can be simplified further to avoid the ternary, but I tend to go
for readability over succinctness.

Python has a nice feature where you can just use the `int` constructor with a
second parameter which is the base to use. So `int("11", 2) == 3`, for example.
I used this to my advantage by just joining the results together as a string and
then passing it to `int`.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

Part 2 was more difficult. At each step, the task was to filter the list of
elements in the input by some rules. The rules depend on calculating whether `0`
or `1` is the most common bit at the \\(n^{\text{th}}\\) column for *all* of the
elements remaining in the list, where \\(n\\) is the iteration number.

There are two values that you have to calculate: the "oxygen generator rating"
and the "CO2 scrubber rating". To calculate the "oxygen generator rating", at
each step you only filter the elements that do not have the most common element,
whereas with the "CO2 scubber rating" you do the opposite.

There are a few gotchas with this part. First (and I screwed this up when I was
solving), you have to be sure that you recompute the frequencies *every
iteration*. This was a key insight that I totally missed. Secondly, you have to
keep track of the remaining candidates for oxygen and CO2 independently.

I screwed up this pretty badly, and took *forever* to solve. There are a few
things that I am going to keep in mind in the future:

* Read the examples sooner. If I had, I think I would have understood what to do
  a lot quicker.

* I reused `i` multiple times which bit me. I need to get out of that habit.

* I need to actually pull down the test input as well as the problem input a lot
  sooner, and verify against it for these harder problems.

</details>