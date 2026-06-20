// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Advent of Code 2023",
  date: datetime(year: 2023, month: 11, day: 30),
  extra: (
    categories: ("Programming",),
    tags: ("Advent of Code", "Wheel Spinner", "Competition"),
    image: "wheel.png",
  ),
)
#show: dir-template

Every year since 2015, #link("https://twitter.com/ericwastl")[Eric Wastl] creates a two-part programming problem
for each of the 25 days of Advent. He publishes a new problem every day at
#link("https://adventofcode.com")[adventofcode.com] at exactly midnight EST which is
22:00 the day before for me in MST. The last two years, I decided to do the
problems as soon as they came out and streamed my problem solving sessions on my
#link("https://twitch.tv/sumnerevans")[Twitch channel] and uploaded them to #link("https://www.youtube.com/@sumnerevans")[my Youtube channel]. The last
#link("https://sumnerevans.com../2021-advent-of-code/index.md")[two]
#link("https://sumnerevans.com../2022-advent-of-code/index.md")[years]
I updated a blog post about each of the days, and I will try and do that this
year as well.

This year, I'm leaving my fate up to chance by spinning a wheel every night
which will dictate what language I use for that night.



I'm going to be streaming some of my solves and I will try and keep this blog
post up-to-date every day with my thoughts on each problem.

= Summary of Results <posts-programming-2023-advent-of-code-summary-of-results>

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

= Day 1: Trebuchet?! <posts-programming-2023-advent-of-code-day-1-trebuchet>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Link:*], [https://adventofcode.com/2023/day/1],
  [*Solutions:*], [#link("https://github.com/sumnerevans/advent-of-code/blob/master/y2023/d01/01.ts")[TypeScript]],
  [*Part 1:*], [00:11:38, 5636th],
  [*Part 2:*], [00:21:47, 2021st],
)

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;iXxL_JxLh1A&quot; title=&quot;Advent of Code 2023 - Day 1 | Random Wheel Spin (*5636, **2021)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[Advent of Code 2023 - Day 1 | Random Wheel Spin (\*5636, \*\*2021)]]

Today I spun *TypeScript*! I spent most of my time figuring out how to read
from `stdin` in Node. There was a lot of DuckDuckGo-ing involved.

I ended up finding how to use the `readline.createInterface` and adding a `line`
listener which added all of the lines to an array and a `close` listener which
did the actual computation.

#html.elem("details", attrs: ("class": "advent-of-code-part-expander", "open": ""))[#html.elem("summary")[#html.elem("h3")[Part 1]]]

In order to find all of the digits, I used `.filter` to iterate through the list
of characters and used a regex for determining whether or not it was a digit.

Then I took the first and last element of the list and then just concatenated
them together as a string and then used `parseInt`.



#html.elem("details", attrs: ("class": "advent-of-code-part-expander", "open": ""))[#html.elem("summary")[#html.elem("h3")[Part 2]]]

For part 2, you now have to also take into account spelled-out numbers like
`one`, `two`, etc.

I didn't realize that they could overlap, so I wasted a couple of submissions on
that.

I did get to abuse the JavaScript type system a bit to construct the final
number:

```js
return parseInt("" + ints[0] + ints[ints.length - 1]);
```



= Day 2: Cube Conundrum <posts-programming-2023-advent-of-code-day-2-cube-conundrum>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Link:*], [https://adventofcode.com/2023/day/2],
  [*Solutions:*], [#link("https://github.com/sumnerevans/advent-of-code/blob/master/y2023/d02/Program.fs")[F\#]],
  [*Part 1:*], [00:44:29, 9493th],
  [*Part 2:*], [>24h, 94541st],
)

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;30a0xIioxMs&quot; title=&quot;Advent of Code 2023 - Day 2 | Random Wheel Spin (*9493, **94541)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[Advent of Code 2023 - Day 2 | Random Wheel Spin (\*9493, \*\*94541)]]

Today I spun *F\#*! It took me a long time to just install and learn how to
read input in F\#, and then it took an even longer time to solve part 1 since I
wasn't really sure what functions I could even use. F\# has some constructs
that are similar to other functional languages that I've used in the past, which
helped the learning curve.

I was hampered by not having syntax highlighting and a language server. I'll
have to figure that out before I spin F\# again.

I don't think that I did anything super novel today, so I'm not going to make
comments about either of the parts.

= Day 7: Camel Cards <posts-programming-2023-advent-of-code-day-7-camel-cards>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Link:*], [https://adventofcode.com/2023/day/7],
  [*Solutions:*], [#link("https://github.com/sumnerevans/advent-of-code/blob/master/y2023/d07/d07.ml")[OCaml]],
  [*Part 1:*], [01:11:56, 8044th],
  [*Part 2:*], [02:06:29, 8720th],
)

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;f8iZByyR1Cc&quot; title=&quot;Advent of Code 2023 - Day 7 | Random Wheel Spin (*8044, **8720)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[Advent of Code 2023 - Day 7 | Random Wheel Spin (\*8044, \*\*8720)]]

Today I spun *OCaml*! It took a very long time for me to get into functional
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

= Day 8: Haunted Wasteland <posts-programming-2023-advent-of-code-day-8-haunted-wasteland>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Link:*], [https://adventofcode.com/2023/day/8],
  [*Solutions:*], [#link("https://github.com/sumnerevans/advent-of-code/blob/master/y2023/d08/Program.fs")[F\#]],
  [*Part 1:*], [00:20:16, 5859th],
  [*Part 2:*], [00:42:07, 2970th],
)

Today I spun *F\#*. It was quite fortunate, because this problem was inherently
pretty recursive in nature. Trees problems are normally very amenable to
recursive thinking. The problem for me was that I couldn't recursively think.

For part 1, I got away with a non-tail-recursive function. I'm not sure if the
non-tail-recursive approach works for part 2 or not, but in my attempts to
optimize part 2 I converted to use a tail-recursive approach which was
sufficiently space-efficient. This is the core of the algorithm. I think it's
quite clean.

```ocaml
let rec step_p1 current directionIdx =
    if current = "ZZZ" then
        directionIdx
    else
        let (left, right) = map[current]

        match directions[directionIdx % directions.Length] with
        | 'L' -> (step_p1 left (directionIdx + 1))
        | 'R' -> (step_p1 right (directionIdx + 1))
        | _ -> failwith "invalid direction"

printfn "%A" (step_p1 "AAA" 0)
```

#html.hr()

*Update:* as you can tell from the lack of posts, I decided to give up on this
year. I had a very busy early December due to lots of grading finishing up the
fall semester as well as a quite busy time at work (we released
#link("https://blog.beeper.com/p/introducing-beeper-mini-get-blue")[Beeper Mini]).

I'm hoping that next year I'll be able to get back to this and spin the wheel
again!
