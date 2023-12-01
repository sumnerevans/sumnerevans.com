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
      caption="The random spinner wheeel which will decide my fate every night"
>}}

I'm going to be streaming some of my solves and I will try and keep this blog
post up-to-date every day with my thoughts on each problem.

[1]: https://twitter.com/ericwastl
[2]: https://twitch.tv/sumnerevans
[3]: https://www.youtube.com/@sumnerevans

# Summary of Results

The following are my results across all of the days.

```
      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  1   00:11:38  5636      0   00:21:47  2021      0
```

Language statistics:

```
$ tokei -e '*.txt' -e '*.json'
===============================================================================
 Language            Files        Lines         Code     Comments       Blanks
===============================================================================
 Go                     50         7646         6331          293         1022
 OCaml                   1           46           37            4            5
===============================================================================
 Total                  51         7692         6368          297         1027
===============================================================================
```

# Day 1: Trebuchet?!

| <!-- -->       | <!-- -->                                                                                |
| -------------- | ----------------------------------------------------------------------------------------|
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
return parseInt('' + ints[0] + ints[ints.length - 1])
```

</details>
