---
title: "Advent of Code 2022"
date: 2022-12-01T09:00:00-06:00
categories: [Programming]
tags: [Advent of Code, Go, competition]
---

Every year since 2015, [Eric Wastl][1] creates a two-part programming problem
for each of the 25 days of Advent. He publishes a new problem every day at
[adventofcode.com](https://adventofcode.com) at exactly midnight EST which is
22:00 the day before for me in MST. The last two years, I decided to do the
problems as soon as they came out and streamed my problem solving sessions on my
[Twitch channel][2] and uploaded them to [my Youtube channel][3]. Last year, I
also updated a [blog post after each day]({{< ref "../2021-advent-of-code" >}})
which I intend to do again this year.

This year, I'm going to be streaming my solves eventually, but for the first few
days, I'm going to skip that because of illness. I will try and keep this blog
post up-to-date every day with my thoughts on each problem, and give a brief
solution sketch.

As with the last last two years, I am participating in a private leaderboad for
the Colorado School of Mines CS department with a bunch of Mines students and
alum. I don't expect to get anywhere close to the top since I'm switching to Go
this year, which will slow me down significantly.

The reason for the switch is twofold:

1. I've been using Go extensively at work, so I'm comfortable writing it now.
2. I want a statically typed language so that I can avoid the annoying type
   errors that have plagued my solves in the past.

We'll see how that goes.

[1]: https://twitter.com/ericwastl
[2]: https://twitch.tv/sumnerevans
[3]: https://www.youtube.com/@sumnerevans

# Summary of Results

My main goal is to solve all of the problems and get 50 stars for the third year
in a row.

The following are my results across all of the days.

```
      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  8   00:08:11   556      0   00:33:16  2632      0
  7   00:39:14  3323      0   00:45:19  2879      0
  6   00:04:50  1891      0   00:06:23  2071      0
  5   00:18:24  2321      0   00:26:01  3205      0
  4   00:03:46   669      0   00:13:17  3984      0
  3   00:11:02  3285      0   00:18:05  3187      0
  2   00:14:26  5517      0   00:19:30  4347      0
  1   00:03:27  1461      0   00:08:04  2857      0
```

# Day 1: Calorie Counting

| <!-- -->       | <!-- -->                                                                                                                                                            |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2022/day/1                                                                                                                                 |
| **Solutions:** | [Go](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d01/01.go), [OCaml](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d01/01.ml) |
| **Part 1:**    | 00:03:27, 1461th                                                                                                                                                    |
| **Part 2:**    | 00:08:04, 2857th                                                                                                                                                    |

Considering this was my first time using Go under time pressure to solve an
Advent of Code problem, I think I did pretty well. I had lots of issues with
input parsing, and then I couldn't figure out how to sort for a while on part 2.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

For part 1, the main challenge was to parse the input into a list of groups.
Each group is separated by an empty line. My existing utilities for doing that
were very poor, so I had to manually do the grouping and parsing which was quite
slow.

After the groups are parsed, then it's fairly trivial to just find the maximum
sum group.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

For part 2, you have to instead sum the three highest-sum groups in the input.
You can be smart about this and keep track of only the largest 3 items in the
list as you scan, but I opted to just sort the list and get the top 3 instead.

That's where things went off the rails. I'd read in the input as `int64`s
because that's what most of my utilities had (I'd built up some Go libraries
since last year by salving previous years' problems in Go), but the Go `sort`
package does not have a convenient function for sorting `int64`s. It only has a
convenient one for `int`s. I ended up just using `sort.Slice` with a custom
comparator.

Go just got generics in 1.18, and they haven't them it into the standard library
at all, so there's no genericism in any of the standard functions. I hope that
they change that in a future version of Go so that the `sort.Ints` function can
be generic over all integer types.

</details>

I put myself into a pretty big hole on the Mines leaderboard from today with an
8\*, 10\*\* performance. I think that's just going to be expected given I'm using
Go now.

# Day 2: Rock Paper Scissors

| <!-- -->       | <!-- -->                                                                        |
| -------------- | ------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2022/day/2                                             |
| **Solutions:** | [Go](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d02/02.go) |
| **Part 1:**    | 00:14:26, 5517th                                                                |
| **Part 2:**    | 00:19:30, 4347th                                                                |

Today was horrible. I failed at reading comprehension, and then incompetence set
in and I forgot how to play rock-paper-scissors.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

The input consisted of a list of rock-paper-scissors (RPS) rounds formatted as
`OPPONENT MY_RESPONSE`. The selection was given by `ABC` for the opponent and
`XYZ` for my response.

The goal was to calculate how many points I'd win given the sequence.

Overall, the input parsing was a lot smoother today. I went with stringly-typed
for the two fields.

The first issue that I had was that I thought it was in the format `MY_RESPONSE OPPONENT` so that cost me a large number of minutes.

The second issue that I ran into was just implementing the scoring logic. It was
hard keeping track of what ABC and XYZ actually stood for, and I had to talk to
myself so that I could work through all of the combinations.

There's an elegant mathematical way of doing this using mod, which I did not use
while solving. I figured there was one, but I didn't want to have to figure it
out during my solve (though it may have been helpful).

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

For the second part, you interpreted your response differently. You interpreted
it as your desired outcome (win, lose, draw) and then had to calculate which
option to choose.

I ended up solving this with a ton of `case` statements. I later refactored to
have a few less case statements, but all of the mathematical solutions that I've
seen are way uglier, so I didn't refactor to use them.

I submitted the wrong value which cost me a minute, but honestly, that wasn't
the main reason I failed today.

</details>

Overall, the problem was just annoying to implement, and I'm hoping for
something more algorithmic tomorrow.

I continue to dig myself into a pretty big hole on the Mines leaderboard with an
15\*, 13\*\* performance. I think that I'm already about to write this year off
as a rebuilding year (doing this in Go, and all). I'm hoping that the static
typing of Go will give me a boost later on in the competition. Unfortunately, by
then I assume that many fewer people will be competing so I'll have no chance to
catch up.

# Day 3: Rucksack Reorganization

| <!-- -->       | <!-- -->                                                                        |
| -------------- | ------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2022/day/3                                             |
| **Solutions:** | [Go](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d03/03.go) |
| **Part 1:**    | 00:11:02, 3285th                                                                |
| **Part 2:**    | 00:18:05, 3187th                                                                |

Today was more fun than yesterday, but I still did horribly as far as time. At
least I was able to comprehend the problem fairly well, except I screwed up the
scoring which cost me, and I also didn't know how to deal with char arrays very
well in Go. This is what happens when you switch languages haha.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

For part 1, you have to split each string in the input in half and then figure
out what character is present in both halves. Then you have to calculate the
score for that character.

To calculate the character that is in both halves, I decided to just load both
halves into a set and do an intersection. Obviously, this is not the most
efficient method, but it (should) have been fairly quick to code. Unfortunately,
I got caught by the fact that `string`s in Go are not just `[]rune`, so I wasted
a lot of time trying to convert it to `[]rune` so that I could use my `Set`
helper data structure. Unfortunately, I chose a very bad way of doing this
(complicated `for` loop) because I forgot that you can just construct them like
this: `[]rune(s)` where `s` is the string to convert to a `rune` array.

After that, the next challenge is figuring out the score for the chosen
character. I forgot that in ASCII A-Z come before a-z and that they are
separated by a bunch of special characters. Thus, when I tried to combine the
cases together, things went poorly. Once I handled each case separately, things
went much more smoothly.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

For the second part, instead of finding the common character between the halves
of each string, you had to find the common character between three lines.

The main issue for me was implementing the windowing correctly. I just totally
botched it. I didn't handle the last window correctly, and I also had a bug
where I would skip the element right after the window.

After I unravelled myself from my own incompetence, calculating the score was
trivial.

</details>

I definitely enjoyed this problem more than last nights problem as there were
not as many annoying implementation details that were difficult to deal with.

I continue to perform very poorly on the Mines leaderboard (8\*, 8\*\*). I'm
just hoping that I can medal at some point this year. There's a lot more people
competing this year who are good (some of whom were in the Algorithms class I
taught last spring), so my chances are not great.

# Day 4: Rucksack Reorganization

| <!-- -->       | <!-- -->                                                                        |
| -------------- | ------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2022/day/4                                             |
| **Solutions:** | [Go](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d04/04.go) |
| **Part 1:**    | 00:03:46, 669th                                                                 |
| **Part 2:**    | 00:13:17, 3984th                                                                |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2022 - Day 4 | Go (669*, 3984**)</summary>
  {{< youtube id="UqS6PInmj9o" title="Advent of Code 2022 - Day 4 | Go (669*, 3984**)" >}}
</details>

Today was the first time that I cracked the top 1000 with my solution. I was
able to get 669th on the first part, before utterly collapsing on the second
part.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

For part 1, the hardest part reading the input into a reasonable format. The
fact that I'm using Go meant that I used `struct`s for storing the data rather
than tuples as I would have in Python.

```go
type Section struct {
	Start, End int
}

type Pair struct {
	Section1, Section2 Section
}

type Day04 struct {
	Pairs []Pair
}
```

This data format allowed me to keep track of what I was dealing with fairly
effectively and not make mistakes related to interpreting data incorrectly.

Reading input in Go is much more difficult than reading input in Python.

On the other hand, Go allows me to define functions on structs, and I was able
to define a `contains` function on the `Section` struct which just determined if
the given `Section` was contained within the first one.

```go
func (s Section) Contains(other Section) bool {
	return s.Start <= other.Start && other.End <= s.End
}
```

After that it was just a matter of incrementing the answer when one section
contained the other.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

In the second part, I fell victim to incompetence (I forgot to save the test
file that I had). I have a great test infrastructure, but it was useless because
there was to test to run. Then I implemented the intersection functionality
incorrectly in almost every way possible.

I defined a function on the `Pair` to determine if the pair intersected or not.
My first mistake was that I used `Min` for calculating the minimum start and
ends of the segments which is not what you want. You want the _maximum_ start
time, and the _minimum_ end time. Then if the start time is less than or equal
to the end time, the there is an overlap.

I then incorrectly dealt with segments that only overlapped on a single element.
I was returning an integer (being the cardinality of the overlap, but I was off
by one because the cardinality of a overlap that starts and ends at the same
point is 1, not 0.)

This last error could be easily avoided by just returning a boolean and not
dealing with cardinality at all.

My final function is as follows:

```go
func (s Section) Intersects(other Section) bool {
	return lib.Max(s.Start, other.Start) <= lib.Min(s.End, other.End)
}
```

</details>

On the Mines leaderboard, I got 4th place on part 1, the best I've done so far.
But happened with the global leaderboard, I fell on part 2 all the way down to
13th place. At the top, Ryan (446) has pulled ahead of Kelly (443) for first
place. Colin is tied with Kelly and Sam is in fourth with 407 points.

# Day 5: Supply Stacks

| <!-- -->       | <!-- -->                                                                        |
| -------------- | ------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2022/day/5                                             |
| **Solutions:** | [Go](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d05/05.go) |
| **Part 1:**    | 00:18:24, 2321th                                                                |
| **Part 2:**    | 00:26:01, 3205th                                                                |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2022 - Day 5 | Go (2321*, 3205**)</summary>
  {{< youtube id="rh2U3Tz5KI4" title="Advent of Code 2022 - Day 5 | Go (2321*, 3205**)" >}}
</details>

Today was an interesting problem with annoying parsing step which made me slow
on Part 1. Then I fell into a trap with slices in Go on Part 2 that cost.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

The hardest part of the entire problem was parsing the input. The stacks at the
top of the problem were really annoying to parse correctly. I know other people
who just hard-coded them, and that probably would have been smarter than what I
did, but then I'd have to figure out a way to differentiate between when I'm
running the test and the actual input.

I ended up using a regular expression to find what character (if any) was in the
stacks at the given height.

Then, reading in the moves was pretty easy because I was able to use my
`lib.AllInts` function to extract the moves.

After everything was parsed, I was able to implement the swapping logic fairly
quickly. I made the nice decision to represent the stacks as lists with the
first element being the top of the stack. It made the swapping code fairly
convenient:

```go
move := []string{d.Stacks[m.From][0]}
d.Stacks[m.From] = d.Stacks[m.From][1:]
d.Stacks[m.To] = append(move, d.Stacks[m.To]...)
```

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

For part 2, I got caught by the fact that taking a slice of a list in Go doesn't
make a copy of the elements. I think it's just a pointer with a length under the
hood. This caused a big bug because I was mutating memory that I really did not
intend to mutate.

I finally realized this and just copied the data using `append` with the `...`
operator on the slice. That actually copied the data and it worked first time
after that.

Overall, not too disappointed with that bug because it wasn't entirely obvious
what Go does under the hood. Now I know (and have a utility function) so I hope
I don't make that mistake again.

</details>

My 6\*, 6\*\* performance on the Mines leaderboard has me in 8th place
currently. I'm hoping that there are some harder algorithmic questions later on
so that I can pass up Jayden and Eugin and catch up with Sam and Keshav, but
with how slowly I've been solving, that's still a pretty tall order.

# Day 6: Tuning Trouble

| <!-- -->       | <!-- -->                                                                        |
| -------------- | ------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2022/day/6                                             |
| **Solutions:** | [Go](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d06/06.go) |
| **Part 1:**    | 00:04:50, 1891th                                                                |
| **Part 2:**    | 00:06:23, 2071th                                                                |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2022 - Day 6 | Go (1891*, 2071**)</summary>
  {{< youtube id="9y2Y20w4MCw" title="Advent of Code 2022 - Day 6 | Go (1891*, 2071**)" >}}
</details>

Today was a sliding window problem. The challenge was to find the first sliding
window of size \\(n\\) such that all of the characters in the window are unique.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

The hardest part was reading it into a reasonable data structure. I ended up
going with `[]rune` instead of `string` because the ergonomics of treating a
`string` like a list of characters is not great in Go.

I ended up just throwing all of the characters in the window into a set and
checking the size of the set. If it was 4 (the window size I was looking for), I
would just return the current index.

Managing the window was somewhat annoying, but my method of appending and
removing from the end was reasonable, and worked well enough. It also had the
nice properly of the index being on the last character of the window rather than
the first.

After solving, I realized that I could just use slices, and I refactored my code
to do so. (I also added a sliding window slices function to my solving library.)

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

Part 2 was the same as part 1, except windows of size 14 instead of 4.

I had a bug in the part 1 implementation where I was only iterating until
`len(input) - n` where `n` was the size of the window I was looking for. This is
incorrect because I was never doing anything that could go out of bounds. Thus,
I had to just iterate to `len(input)` instead. If I had my sliding window
function already, then I wouldn't have had this problem. That cost me quite a
few places on the global rankings, but oh well.

</details>

My 8\*, 8\*\* performance on the Mines leaderboard has me up to 7th place
currently.

# Day 7: No Space Left On Device

| <!-- -->       | <!-- -->                                                                        |
| -------------- | ------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2022/day/7                                             |
| **Solutions:** | [Go](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d07/07.go) |
| **Part 1:**    | 00:39:14, 3323rd                                                                |
| **Part 2:**    | 00:45:19, 2879th                                                                |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2022 - Day 7 | Go (3323*, 2879**)</summary>
  {{< youtube id="3h8l9lqczbY" title="Advent of Code 2022 - Day 7 | Go (3323*, 2879**)" >}}
</details>

Today was much more challenging than I expected, but it seems like it was fairly
challenging to most people considering I solved part 1 in just under 40 minutes,
and still was sub 5000.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

At its core, the problem required keeping track of the size of directories and
then doing some processing with that. The input was given as a sequence of `cd`
and `ls` commands which showed the directory structure and the sizes of the
files in each directory.

The hardest part was choosing a data structure to keep track of the directory
structure. It took me along while, but I eventually landed on a recursive data
structure with an internal mapping of `name -> item` where `item` was either a
file or another directory.

My struct ended up needing a flag for whether it was a directory or not, which
is slightly ugly, but I think it helped avoid some errors. I did wish for
OCaml/Rust enum variants though...

The next challenge was keeping track of the current path so that I could store
the file size in the correct location in the data structure. I ended up storing
the path as a list of strings, and then reconstructing the path when appending.
When I refactored, I just passed the list to the add function rather than a
string.

I implemented the actual "add file" functionality using recursion which I think
was a good decision.

The next challenge was to find all of the sizes of all of the directories in the
filesystem tree. I used a BFS to traverse the tree and for all of the
directories, I checked if their size was less than the threshold.

The main problem that I had during this part of the implementation was the fact
that I implemented the `IsDir` flag incorrectly. I should have just used the
presence of `Size > 0` as a proxy for the flag, but instead I spent precious
minutes debugging why the flag was set incorrectly.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

Part 2 required finding the smallest directory which (if deleted) would cause
the total used size to fall below a given threshold.

I was able to solve this part pretty easily by modifying my iteration logic to
result in a list of integers representing the sizes of the directories.

The biggest challenge was that I overcomplicated the data structures (common
pattern) and had to do a couple transformations that were quite annoying.

</details>

My 10\*, 10\*\* performance on the Mines leaderboard kept me stable at 7th
place. I lost tons of points to Sam tonight. He had a 2\*, 2\*\* performance,
which has put him at 727 points against my 696. Josh (697) and Keshav (719) also
outrank me. At the top of the leaderboard, Kelly (796) is starting to pull away
from Colin (787) and Ryan (783) who both had bad nights (4*, 7\*\*) and (6*,
5\*\*), respectively.

# Day 8: Treetop Tree House

| <!-- -->       | <!-- -->                                                                        |
| -------------- | ------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2022/day/8                                             |
| **Solutions:** | [Go](https://github.com/sumnerevans/advent-of-code/blob/master/y2022/d08/08.go) |
| **Part 1:**    | 00:08:11, 556th                                                                 |
| **Part 2:**    | 00:33:16, 2632nd                                                                |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2022 - Day 8 | Go (556*, 2632**)</summary>
  {{< youtube id="cz8FD6jUW1A" title="Advent of Code 2022 - Day 8 | Go (556*, 2632**)" >}}
</details>

Today was an interesting nice grid problem. I did pretty well on part 1, and
then choked really badly on part 2. I'm happy to have returned to top 1000 on
part 1. I wish I could have kept the momentum up into part 2.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

For part 1, you are given a grid of trees of a certain height. The problem was
to find the set of trees that are visible from the edges of the grid. Visibility
is defined by the height of the tree being greater than any of the trees between
itself and the edge in the four cardinal directions.

I decided to implement my solution by iterating from all four sides of the grid
and incrementing a counter whenever I encounter a taller tree. This method
worked quite well, and I was able to implement it for rows very easily (iterate
from the left and from the right keeping track of the current highest tree, and
incrementing the answer and updating the highest tree if I encountered a higher
tree).

To account for the vertical directions in the grid, I was able to utilize my
`lib.Columns` utility function which transposes a grid. Then I was able to
copy-paste my code for rows but use the transposed grid instead.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

On part 2, I totally collapsed. The challenge was to find the tree which had the
longest product of sight-lines in the four cardinal directions.

My first implementation of calculating sight lines in the four directions for a
given tree was just flat out incorrect. Instead of incrementing the sight line
length before checking if the tree is tall enough to block the sight line, I was
incrementing after checking if the tree was too tall.

I ended up declaring bankruptcy on that first implementation, and then I finally
implemented it correctly.

I think it was a good decision to declare bankruptcy and rewrite. I could have
wasted a lot of time if I had continued trying to debug my first implementation.

</details>

I podiumed on the Mines leaderboard for the first time today on part 1 before
collapsing on part 2. Sam beat me by literally a second on part 1 (ahhhhh!) so I
ended up with a 2*, 7** finish.

I (805) have now jumped over Eugin (803) for 6th place, and I'm 10 points behind
Keshav (815). Sam's 1\*, 1\*\* performance puts him at 843, which is probably
going to be enough to secure him 4th place, and puts him in possible contention
for 3rd.
