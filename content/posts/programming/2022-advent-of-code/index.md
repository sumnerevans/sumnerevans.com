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

1. I've been using Go extensively at work, so I'm very comfortable writing it
   now.
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

I continue to perform very poorly on the Mines leaderboard (8*, 8**). I'm just
hoping that I can medal at some point this year. There's a lot more people
competing this year who are good (some of whom were in the Algorithms class I
taught last spring), so my chances are not great.
