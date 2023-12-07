---
title: "Advent of Code 2023"
date: 2023-11-30T09:00:00-06:00
categories: [Programming]
tags: [Advent of Code, Wheel Spinner, Competition]
image: ./wheel.png
---

Every year since 2015, [Eric Wastl][1] creates a two-part programming problem
for each of the 25 days of Advent. He publishes a new problem every day at
[adventofcode.com](https://adventofcode.com) at exactly midnight EST which is
22:00 the day before for me in MST. The last two years, I decided to do the
problems as soon as they came out and streamed my problem solving sessions on my
[Twitch channel][2] and uploaded them to [my Youtube channel][3]. The last
[two]({{< ref "../2021-advent-of-code" >}})
[years]({{< ref "../2022-advent-of-code" >}})
I updated a blog post about each of the days, and I will try and do that this
year as well.

This year, I'm leaving my fate up to chance by spinning a wheel every night
which will dictate what language I use for that night.

{{< figure
    src="./wheel.png"
    target="_blank"
    title="Spinner wheel which will decide my fate every night"
    caption="The random spinner wheel which will decide my fate every night" >}}

I'm going to be streaming some of my solves and I will try and keep this blog
post up-to-date every day with my thoughts on each problem.

[1]: https://twitter.com/ericwastl
[2]: https://twitch.tv/sumnerevans
[3]: https://www.youtube.com/@sumnerevans

# Summary of Results

The following are my results across all of the days.

```
      -------Part 1--------   --------Part 2--------
Day       Time  Rank  Score       Time   Rank  Score
  7   01:11:56  8044      0   02:06:29   8720      0
  5   01:14:02  9429      0          -      -      -
  2   00:44:29  9493      0       >24h  94541      0
  1   00:11:38  5636      0   00:21:47   2021      0
```

Language statistics:

```
$ tokei -e '*.txt' -e '*.json'
===============================================================================
 Language            Files        Lines         Code     Comments       Blanks
===============================================================================
 Batch                   1           92           71            0           21
 F#                      3           78           63            5           10
 Kotlin                  4          171          115           31           25
 MSBuild                 4           44           38            0            6
 OCaml                   2          229          189           19           21
 Shell                   1          249          106          117           26
 TypeScript              1           48           44            0            4
===============================================================================
 Total                  16          911          626          172          113
===============================================================================
```

# Day 1: Trebuchet?!

| <!-- -->       | <!-- -->                                                                                |
| -------------- | --------------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2023/day/1                                                     |
| **Solutions:** | [TypeScript](https://github.com/sumnerevans/advent-of-code/blob/master/y2023/d01/01.ts) |
| **Part 1:**    | 00:11:38, 5636th                                                                        |
| **Part 2:**    | 00:21:47, 2021st                                                                        |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2023 - Day 1 | Random Wheel Spin (*5636, **2021)</summary>
  {{< youtube id="iXxL_JxLh1A" title="Advent of Code 2023 - Day 1 | Random Wheel Spin (*5636, **2021)" >}}
</details>

Today I spun **TypeScript**! I spent most of my time figuring out how to read
from `stdin` in Node. There was a lot of DuckDuckGo-ing involved.

I ended up finding how to use the `readline.createInterface` and adding a `line`
listener which added all of the lines to an array and a `close` listener which
did the actual computation.

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 1</h3></summary>

In order to find all of the digits, I used `.filter` to iterate through the list
of characters and used a regex for determining whether or not it was a digit.

Then I took the first and last element of the list and then just concatenated
them together as a string and then used `parseInt`.

</details>

<details class="advent-of-code-part-expander" open>
<summary><h3>Part 2</h3></summary>

For part 2, you now have to also take into account spelled-out numbers like
`one`, `two`, etc.

I didn't realize that they could overlap, so I wasted a couple of submissions on
that.

I did get to abuse the JavaScript type system a bit to construct the final
number:

```js
return parseInt("" + ints[0] + ints[ints.length - 1]);
```

</details>

# Day 2: Cube Conundrum

| <!-- -->       | <!-- -->                                                                             |
| -------------- | ------------------------------------------------------------------------------------ |
| **Link:**      | https://adventofcode.com/2023/day/2                                                  |
| **Solutions:** | [F#](https://github.com/sumnerevans/advent-of-code/blob/master/y2023/d02/Program.fs) |
| **Part 1:**    | 00:44:29, 9493th                                                                     |
| **Part 2:**    | >24h, 94541st                                                                        |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2023 - Day 2 | Random Wheel Spin (*9493, **94541)</summary>
  {{< youtube id="30a0xIioxMs" title="Advent of Code 2023 - Day 2 | Random Wheel Spin (*9493, **94541)" >}}
</details>

Today I spun **F#**! It took me a long time to just install and learn how to
read input in F#, and then it took an even longer time to solve part 1 since I
wasn't really sure what functions I could even use. F# has some constructs
that are similar to other functional languages that I've used in the past, which
helped the learning curve.

I was hampered by not having syntax highlighting and a language server. I'll
have to figure that out before I spin F# again.

I don't think that I did anything super novel today, so I'm not going to make
comments about either of the parts.

# Day 7: Camel Cards

| <!-- -->       | <!-- -->                                                                            |
| -------------- | ----------------------------------------------------------------------------------- |
| **Link:**      | https://adventofcode.com/2023/day/7                                                 |
| **Solutions:** | [OCaml](https://github.com/sumnerevans/advent-of-code/blob/master/y2023/d07/d07.ml) |
| **Part 1:**    | 01:11:56, 8044th                                                                    |
| **Part 2:**    | 02:06:29, 8720th                                                                    |

<details class="youtube-expander">
  <summary><i class="fa fa-youtube-play"></i>&nbsp;Advent of Code 2023 - Day 7 | Random Wheel Spin (*8044, **8720)</summary>
  {{< youtube id="f8iZByyR1Cc" title="Advent of Code 2023 - Day 7 | Random Wheel Spin (*8044, **8720)" >}}
</details>

Today I spun **OCaml**! It took a very long time for me to get into functional
programming mode. The first task was to parse the hand into a tuple of
`(hand_type, hand_values)` where `hand_values` was just a tuple of integers
representing the card values.

In order to do that, I sorted the characters in the hand and then compressed
them into a sorted list of `(count, character)` tuples. Then, I pattern matched
on the different possible combinations of counts. For example, if you have
`AA233`, then it would sort into:
```ocaml
[(1, '2'); (2; 'A'); (2, '3')]
```
which I was able to pattern match with:
```ocaml
match hand with
  ...
  | [_; (2, _); (2, _)] -> (TwoPair, ...)
```

It took me a very long time to figure out how to do it properly, but eventually
I was able to get it.

I had a really horrible part 2 delta because my pattern matching-foo was not
very good, and I missed a couple of cases that forced me to just debug through
each hand one at a time.
