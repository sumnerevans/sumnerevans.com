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
  7   00:02:29   252      0   00:10:14  1865      0
  6   00:03:14   122      0   00:06:50   175      0
  5   00:13:24  1238      0   00:36:27  2733      0
  4   00:16:54   845      0   00:37:47  2325      0
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

Day 4: Giant Squid
==================

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **Link:** | https://adventofcode.com/2021/day/4 |
| **Solutions:** | [Python](https://github.com/sumnerevans/advent-of-code/blob/master/2021/04.py) |
| **Part 1:** | 00:16:54, 845th |
| **Part 2:** | 00:37:47, 2325th |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2021 - Day 4 | Python (845*, 2325**)</summary>
  {{< youtube id="Lahkxd4INSo" title="Advent of Code 2021 - Day 4 | Python (845*, 2325**)" >}}
</details>

Today's part 2 was another disaster (see below for details). Part 1 went pretty
decently, and I made it to the top 1000 again.

I liked the problem, but the edge case that I failed to handle cost me ~17
minutes, and probably 6 points on the Mines leaderboard (which is devastating,
since I am currently sitting at 4th with 301 points, but first second and third
are clustered at 316, 313, and 312).

The test infrastructure that I added somewhat helped, but I have some
improvements that I need to make before tomorrow.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

The core of the problem was calculating if a board has won bingo. Luckily we
only had to handle rows and columns, since diagonals are really quite annoying
to implement.

To determine if a given row or column had won, I converted to a set, subtracted
the set of numbers that had been called, and then checked if I got the empty
set. If I did, then it was bingo, and the board had won.

```python
def checkset(row_or_col: List[int], called: List[int]) -> bool:
    return set(row_or_col) - set(called) == set()
```

For part 1, you just have to keep adding numbers from the sequence of called
numbers until a board wins. The score calculation was a bit annoying, since you
have to sum up all of the numbers that had *not* been called. I missed that, and
submitted the wrong thing (thinking it was the sum of the ones that *had* been
called).

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

For part 2, the task was to determine which board won last. I understood the
task right away, but then I made a fatal mistake. Every time a board won, I
would remove it from the list of boards. Then, when there was one board
remaining, I did the score calculation. However, this is incorrect. You must
play out the game until that last board wins bingo.

I spent about 17 minutes fixing that bug.

</details>

Day 5: Hydrothermal Venture
===========================

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **Link:** | https://adventofcode.com/2021/day/5 |
| **Solutions:** | [Python](https://github.com/sumnerevans/advent-of-code/blob/master/2021/05.py) |
| **Part 1:** | 00:13:24, 1238th |
| **Part 2:** | 00:36:27, 2733rd |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2021 - Day 5 | Python (1238*, 2733**)</summary>
  {{< youtube id="cZ13TeADxKM" title="Advent of Code 2021 - Day 5 | Python (1238*, 2733**)" >}}
</details>

Today was not ideal. It was not as disastrous as yesterday, but it was still
fairly unfortunate.

I thought that the problem was nice. The core of the problem was determining
intersections of horizontal, vertical, and (for part 2) diagonal lines. On part
2, I forgot basic algebra concepts; namely that slope can be positive or
negative. That cost me many minutes of debugging.

The test infrastructure improvements I made after yesterday were useful, and
saved me a couple seconds.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

Because the size of the grid is fairly small (no numbers are over 3 digits),
it's efficient enough to just store the number of lines that go over a given
point in a `position -> number of lines covering` dictionary.

For part 1, the key was to ignore all diagonal lines. To do that, either `x1 ==
x2` or `y1 == y2`. If so, then it is a horizontal or vertical line.

The input can be provided with the first point "higher" than the second point,
so I used something that I thought was pretty clever to handle that: I just
sorted the position tuples. (Note that after solving, I added new helper
functions that allows me to perform directional ranges meaning that the range
will work regardless of whether the end is greater than the start or not.)

Then, I used a double `for` loop which fills in `G` with the line in regardless
of whether the line is vertical or horizontal. It is guaranteed to work here
because one of the for loops will only have a single iteration.

```python
G = defaultdict(int)
for x in range(x1, x2 + 1):
    for y in range(y1, y2 + 1):
        G[(x, y)] += 1
```

I also made use of 
[`defaultdict`](https://docs.python.org/3.8/library/collections.html#collections.defaultdict).
This allows me to index into a dictionary and if that key is not in the
dictionary, it will initialize it using the constructor given. In this case
`int` (which is `0` by default).

I then just counted how many items in the graph were greater than 0.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

For part 2, I thought I could use basically the same logic as part 1 with
sorting the points, but I made a fatal mistake. While the `x` points are sorted
correctly, the `y` coordinate could go either up or down depending on which
diagonal the line is on. Literally elementary school math, but I managed to
screw it up. I managed to waste a ton of time figuring that out.

The way I ended up solving it on stream was using an if statement to determine
if `y` should go up or down. I then refactored it to calculate slope.

After the stream, I came up with an even more ingenious way to handle diagonals
that involves the new directional range function.

```python
for x, y in zip(dirange(x1, x2), dirange(y1, y2)):
    G[(x, y)] += 1
```

What this does is goes through all of the `(x, y)` pairs starting at `(x1, y1)`
and going to `(x2, y2)`. This works even if `x1 > x2` or `y1 > y2` because
`dirange` figures out the correct direction to iterate in in order to always go
from the start to the end of the range.

</details>

Day 6: Lanternfish
==================

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **Link:** | https://adventofcode.com/2021/day/6 |
| **Solutions:** | [Python](https://github.com/sumnerevans/advent-of-code/blob/master/2021/06.py), [OCaml](https://github.com/sumnerevans/advent-of-code/blob/master/2021/06.ml) |
| **Part 1:** | 00:03:14, 122th |
| **Part 2:** | 00:06:50, 175th |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2021 - Day 6 | Python (122*, 175**)</summary>
  {{< youtube id="N7cWDWK-2oU" title="Advent of Code 2021 - Day 6 | Python (122*, 175**)" >}}
</details>

Today went very well for me (besides one hiccup with a missing import in my
starter code which probably cost me a leaderboad spot). I got top 200 on both
parts. I think there were two main reasons for the success:

1. I went with the easy, inefficient solution for part 1. Instead of trying to
   prematurely optimize, I just went ahead and simulated the exponential growth.

2. I realized it would be inefficient to do 256 almost immediately (my test
   infrastructure helped me with that). I then paused for a moment to think of
   the optimization necessary, and figured that out very quickly.

After solving part 2, I refactored so that both part 1 and part 2 use the same
code.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

For part 1, I took the most straightforward simulation approach, which was to
simulate the reproduction of the lanternfish at every single day exactly as the
problem description specified. I recreated the list of lanternfish every single
day, which is very inefficient, but for 80 days, it is efficient enough.

For each lanternfish in the list at any given day, I added one or two elements
to the new array. If the lanternfish was at `0`, then I added an 8 and a 6 to
the new array, and if the lanternfish was anything else (say `x`), I just added
`x - 1` to the list.

Then, the answer is the number of lanternfish after 80 iterations.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

As mentioned above, for part 2 you have to make an optimization. The
optimization is to use a dictionary to an aggregation of all of the lanternfish
at the same stage in life. For example, for the sample input:
```
3,4,3,1,2
```
the corresponding dictionary would be:
```python
{
  1: 1,  # one lanternfish at 1 day until breeding
  2: 1,
  3: 2,  # two lanternfish at 3 days until breeding
  4: 1
}
```

Then, at each day I just recreated the dictionary following the rules of
regeneration, but instead of moving the fish to the new life-stage one at a
time, the dictionary allows me to do it in bulk.

The only other interesting thing that I did for this problem was use a
[`defaultdict`](https://docs.python.org/3.8/library/collections.html#collections.defaultdict).
This allowed me to index into, and then modify, the new dictionary without
worrying about whether the key exists or not in the dictionary.

</details>

Day 7: The Treachery of Whales
==============================

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| **Link:** | https://adventofcode.com/2021/day/7 |
| **Solutions:** | [Python](https://github.com/sumnerevans/advent-of-code/blob/master/2021/07.py), [OCaml](https://github.com/sumnerevans/advent-of-code/blob/master/2021/07.ml) |
| **Part 1:** | 00:02:29, 252nd |
| **Part 2:** | 00:10:14, 1865th |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2021 - Day 7 | Python (252*, 1865**)</summary>
  {{< youtube id="VceuLfVAu90" title="Advent of Code 2021 - Day 7 | Python (252*, 1865**)" >}}
</details>

Part 1 went fairly well for me today. Part 2 did not go quite as well (I missed
a key insight into the problem), but it was not a decent enough performance so I
didn't loose too many points on the Mines leaderboard.

I also solved this problem in OCaml after cleaning up my Python code.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

For both parts, brute force is fast enough. The core brute-force algorithm is
checking every single possible alignment point, and determining which of them
gives you the best total "fuel cost" as defined by the problem. The fuel cost
for every submarine is just the distance from the submarine's position to the
alignment point. Then, you can just iterate over the possible alignment
locations which are all integer values between the minimum element in the
sequence and the maximum element in the sequence.

During my initial solve, I just used a for loop to do the minimization because
that was easy, and I didn't have to think very hard about it. After the stream,
I converted it to use much more functional code (more details below).

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

For part 2, the only thing that changes is the cost function. Instead of being
the distance between the alignment location and the submarine position, the cost
of moving $n$ places is
\\[\sum_{k=1}^n k.\\]
It is efficient enough to do a `for` loop to calculate this manually (which is
what I did), but you can also use the formula
\\[\sum_{k=1}^n k = \frac{n(n+1)}{2}\\]
which makes the program run *much* faster.

The reason my part 2 code did not work first time was because I missed a key
insight which was that the alignment point did not necessarily have to be at one
of the existing submarine locations. This cost me many minutes of debugging.

</details>

After my initial solution, I refactored my Python code to be more functional.
The core of the algorithm is now very concise, and uses the `min` function with
generators to minimize the sum of the costs for each of the crab submarines.

```python
def calc_best_alignment(seq: List[int], cost_fn: Callable[[int, int], int]) -> int:
    return min(sum(cost_fn(v, k) for k in seq) for v in irange(*seqminmax(seq)))

seq = [int(x) for x in lines[0].split(",")]
print("Part 1:", calc_best_alignment(seq, lambda x, y: abs(x - y)))
print("Part 2:", calc_best_alignment(seq, lambda a, b: sum(irange(1, abs(a - b)))))
```
