// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Mines High School Programming Competition 2021",
  date: datetime(year: 2021, month: 1, day: 13),
  extra: (
    categories: ("School",),
    tags: ("High School Programming Competition", "Competitive Programming", "Mines", "HSPC"),
    math: true,
  ),
)
#show: page-template

For the last four years, the Mines Computer Science Department has hosted a High
School Programming Competition (HSPC) modelled after the
#link("https://icpc.global/")[International Collegiate Programming Contest (ICPC)]. I
wrote about the #link("https://sumnerevans.com./2019-hspc")[2019] and
#link("https://sumnerevans.com./2020-hspc")[2020] competitions on this blog. This year, I wrote one
of the problems and helped with some of the administrative backend. I also
hosted a live broadcast during the competition with another CS\@Mines alum,
#link("https://samsartor.com")[Sam Sartor] which you can view on YouTube. In the
broadcast, we provided commentary on the competition, hosted interviews with
problem authors, and talked to former HSPC and ICPC contestants.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;1-W1Jh2ZibI&quot; title=&quot;CS@Mines High School Programming Competition 2021&quot; */

#html.elem("details", attrs: ("class": "youtube-expander", "open": ""))[#html.elem("summary")[CS\@Mines High School Programming Competition 2021]]

Similar to the 2020 competition, due to the ongoing COVID-19 lockdowns, the
competition was held remotely. As such, we were again unable to enforce a
no-internet rule as we are able to during on-site competitions. Luckily, the
problems are all unique, and written by Mines students and Mines alum
specifically for the competition which makes it very difficult to search the
internet for answers.

The competition saw a total of 55 teams from all around the nation, the most
ever in a CS\@Mines HSPC. The problems ranged in difficulty from a problem
requiring contestants to perform very basic arithmetic, to a problem that
required the use of _dynamic programming_.

In this post, I'm going to give a few highlights of the competition, and then
explain the problems in the competition (with relatively detailed solution
sketches). Additionally, this year for the first time interviews with (most of)
the problem authors are also available.

== Competition Highlights <posts-school-2021-hspc-competition-highlights>

*You can view full standings for the competition at:*
https://mines21.kattis.com/standings

This year's competition was very exciting. All of the contestants at HSPC this
year did a great job. Here are a few highlights of the competition:

- All teams solved at least two problems, and all but one team solved at least
  four problems.
- Five teams solved all thirteen of the problems.
- The top three teams were from out-of-state.
- River Hill High School won both first and third place. Both teams solved all
  of the problems in the first ninety minutes.
- Teams from Colorado won fourth and fifth place, with Rocky Mountain High
  School taking fourth, and STEM School Highlands Ranch (winners last year)
  taking fifth.
- PEN A Team (second place) came back for second in the 124th minute, winning on
  time because they only had one incorrect submission as compared to River Hill
  High School Team 2 who had nine incorrect submissions.
- The Fellowship of the String (fifth place) solved problem M in the 206th
  minute, four minutes before the end of the competition.

== The Problems <posts-school-2021-hspc-the-problems>

#html.blockquote[
\[!WARNING\]
The rest of this post should be treated like a solutions manual. I hope that
this is an extremely helpful resource when you get stuck, but you should _try_
to solve each of the problems before reading the solutions. There's no magic
amount of time that you should try to solve the problem before looking at the
solution sketch, but I think a good rule of thumb is after you've tried at
least three ideas on your own, then you can read at the solution sketch.

*Remember: You will not learn anything if you just read the explanations!*

]

There were thirteen problems in the competition written by eight different
authors. The problems can be viewed at https://mines21.kattis.com/problems. The
following lists each of the problems' names and a short description of the
algorithm required to solve the problem, listed in the order in which they
appeared in competition:

- *A: M-Climb* -- Basic arithmetic.
- *B: 13 Floors* -- Use an `if` statement.
- *C: Rolling the Dice* -- Simple arithmetic
- *D: Tall Enough* -- Verify that all numbers in a list are greater than a
  constant.
- *E: Marble Maze* -- State machine with a time-step simulation.
- *F: Follow the Prize* -- Simple state machine.
- *G: Alphabet Soup* -- Simple set subtraction.
- *H: Powering Teslopolis* -- Calculate grid adjacencies.
- *I: Tic-Tac-Toe* -- Determine who won a tic-tac-toe game.
- *J: Quadratic Autopilot* -- Solve for the coefficients of a parabola.
- *K: Knight Walk* -- Breadth-first search (BFS).
- *L: Math in Another Universe* -- Math evaluation with different precedence.
- *M: Delivery Driver* -- Dynamic programming.

Problem *A* was designed to be the easiest problem, while *M* was intended
to be the hardest problem. The following subsections are going to describe the
problems and provide fairly detailed solution sketches for each one, sorted by
their intended relative difficulty with the easiest ones first. Interviews with
the problem authors of each problem are also provided.

I do not try and build up from first principles in each of these explanations
(and corresponding videos). Rather, I try and make the explanations accessible
to anyone who feels like solving the problem is within their grasp, but they
can't figure out one or two of the key ideas to crack the problem. For the
easiest problems, I start much closer to first principles, but as the problems
get harder, I start assuming more and more base understanding of programming.

Additionally, I'm only presenting a single solution for each problem here. There
are likely many alternative ways to solve each of these problems.

Slightly less detailed solution sketches were presented at the closing
ceremonies which can be viewed below.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;-7Zf7zbDpxI&quot; title=&quot;CS@Mines HSPC 2021 Solution Sketch Presentation&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Solution Sketch Presentation]]

=== A - M-Climb <posts-school-2021-hspc-a-m-climb>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.mclimb],
  [*Author*], [Jack Garner],
  [*Attempts*], [71],
  [*Correct*], [55],
  [*Percentage*], [100%],
  [*Concept*], [basic operations on variables],
)

M-Climb was designed to be a very trivial problem. It was inspired by the annual
M-Climb tradition at Mines where freshmen hike up Mount Zion to the big M with
10-pound rocks from their hometown, and then whitewash the M (and themselves).
All while singing the fight song over and over very loudly.

For this problem, you must multiply (m) (the number of rocks) by (n) (the
cost of a litre of paint). This gives you the total price of paint for painting
the M because each rock requires 1 litre of paint.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;A8u67MRyuEo&quot; title=&quot;CS@Mines HSPC 2021 Interview with Jack Garner (Contest Organizer and Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Jack Garner (Contest Organizer and Problem Author)]]

=== B - 13 Floors <posts-school-2021-hspc-b-13-floors>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.13floors],
  [*Author*], [Colin Siles],
  [*Attempts*], [73],
  [*Correct*], [55],
  [*Percentage*], [100%],
  [*Concept*], [conditionals (`if` statements)],
)

This problem was intended to be a fairly trivial problem as well. It involves
using an `if` statement to determine if the given number is greater than or
equal to 13. If it is, then print the number plus one. If it is not, then print
the number.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;H3uyK2qFfA0&quot; title=&quot;CS@Mines HSPC 2021 Interview with Colin Siles (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Colin Siles (Problem Author)]]

=== C - Rolling the Dice <posts-school-2021-hspc-c-rolling-the-dice>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.rollingthedice],
  [*Author*], [Adam Sandstedt],
  [*Attempts*], [92],
  [*Correct*], [53],
  [*Percentage*], [96%],
  [*Concept*], [basic string processing and operations on variables],
)

The math at the core of this problem is fairly easy, however, parsing is
slightly non-trivial. The input format is `XdY+Z`, and you have to extract `X`,
`Y`, and `Z`. The easiest way to do this is to split the string by `d` to get
`X` and `Y+Z`, and then split the second part by `+`. Once split, you have to
convert all of the strings to integers, and then the solution (S) is given by
the following equation:

\[ S = \\underbrace{ \\frac{X + (X \\times Y)}{2} }_{ \\text{average of \$X\$ and \$X
\\times Y\$} } + \\underbrace{Z}_{\\text{offset by \$Z\$}} \]

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;yZa3WKo6RW4&quot; title=&quot;CS@Mines HSPC 2021 Interview with Adam Sandstedt (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Adam Sandstedt (Problem Author)]]

=== D - Tall Enough <posts-school-2021-hspc-d-tall-enough>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.tallenough],
  [*Author*], [Jack Garner],
  [*Attempts*], [81],
  [*Correct*], [54],
  [*Percentage*], [98%],
  [*Concept*], [a `for` loop with a conditional],
)

This problem requires the use of a _loop_ to iterate over all of the numbers in
the input. If any of the numbers are less than 48, then `False` should be
printed. If all of the numbers are greater than or equal to 48, then `True`
should be printed.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;A8u67MRyuEo&quot; title=&quot;CS@Mines HSPC 2021 Interview with Jack Garner (Contest Organizer and Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Jack Garner (Contest Organizer and Problem Author)]]

=== G - Alphabet Soup <posts-school-2021-hspc-g-alphabet-soup>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.alphabetsoup],
  [*Author*], [Colin Siles],
  [*Attempts*], [99],
  [*Correct*], [50],
  [*Percentage*], [91%],
  [*Concept*], [loops + a set or list],
)

This problem requires taking a string of characters and verifying that every
letter of the alphabet is present in the string, and printing the ones which are
not present if there are any missing. There are many ways of accomplishing this,
but one easy way is to put the characters of the input string into a _set_, then
perform a set subtraction with a set of all of the upper-case letters. If there
are any remaining letters, print them in sorted order. If there are no remaining
letters, print `Alphabet Soup!`.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;H3uyK2qFfA0&quot; title=&quot;CS@Mines HSPC 2021 Interview with Colin Siles (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Colin Siles (Problem Author)]]

=== I - Tic-Tac-Toe Solver <posts-school-2021-hspc-i-tic-tac-toe-solver>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.tictactoesolver],
  [*Author*], [Jack Garner],
  [*Attempts*], [113],
  [*Correct*], [44],
  [*Percentage*], [80%],
  [*Concept*], [conditionals (`if` statements)],
)

This problem requires you to determine which player won a tic-tac-toe game. The
first challenge is reading the input into a 2-D list or array. Then, once you've
read in the input, the easiest thing to do is hard-code the 16 win
configurations with `if` statements. If none of the win conditions are met, then
nobody has won so you should output `N`.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;A8u67MRyuEo&quot; title=&quot;CS@Mines HSPC 2021 Interview with Jack Garner (Contest Organizer and Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Jack Garner (Contest Organizer and Problem Author)]]

=== F - Follow the Prize <posts-school-2021-hspc-f-follow-the-prize>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.followtheprize],
  [*Author*], [Colin Siles],
  [*Attempts*], [90],
  [*Correct*], [50],
  [*Percentage*], [91%],
  [*Concept*], [loops],
)

For this problem, you need to keep track of which cup holds the prize in a
variable. Then, in a loop, go through all of the swaps in order. If at any point
one of the cups being swapped matches your variable, you need to update your
variable to refer to the swapped cup.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;H3uyK2qFfA0&quot; title=&quot;CS@Mines HSPC 2021 Interview with Colin Siles (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Colin Siles (Problem Author)]]

=== E - Marble Maze <posts-school-2021-hspc-e-marble-maze>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.marblemaze],
  [*Author*], [Sam Sartor],
  [*Attempts*], [44],
  [*Correct*], [26],
  [*Percentage*], [47%],
  [*Concept*], [conditionals + loops + 2-D arrays],
)

The key to this problem is to keep a separate bit of state for each seesaw.

Then, move each of the (N) marbles step-by-step through the maze according to
the rules for each grid square, toggling the seesaw states as needed. Be careful
to avoid indexing mistakes, especially along the edges of the grid.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;1ok8sB7JO_8&quot; title=&quot;CS@Mines HSPC 2021 Interview with Sam Sartor (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Sam Sartor (Problem Author)]]

=== H - Powering Teslopolis <posts-school-2021-hspc-h-powering-teslopolis>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.poweringteslopolis],
  [*Author*], [John Henke],
  [*Attempts*], [72],
  [*Correct*], [29],
  [*Percentage*], [53%],
  [*Concept*], [conditionals + loops + 2-D arrays],
)

For this problem, you likely want to use a nested for loop to search every row
and column of Teslopolis. For every cell in the grid, you need to check all of
the adjacent cells (including diagnols) for a power station. Although there are
alternatives, the simplest option is to create an if statement for each
neighbor. If any neighbors are power cells, then the cell you're looking at is
powered. It is important not to go out-of-bounds when at an edge.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;8kF9dFtv4Qk&quot; title=&quot;CS@Mines HSPC 2021 Interview with John Henke (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with John Henke (Problem Author)]]

=== J - Quadratic Autopilot <posts-school-2021-hspc-j-quadratic-autopilot>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.quadraticautopilot],
  [*Author*], [David Florness],
  [*Attempts*], [60],
  [*Correct*], [21],
  [*Percentage*], [38%],
  [*Concept*], [operations on variables],
)

This problem requires solving for (a), (b), and (c) in terms of the input
points' coordinates. The best way to solve this is to take the three equations
you are given, and just start substituting until you are able to write one of
them in terms of just the coordinates. After much algebra, you will get a
solution.

\[ \\begin{align\*} b &= \\frac{ x\_1^2(y\_2 - y\_3) + x\_2^2(y\_3 - y\_1) + x\_3^2(y\_1 -
y\_2) }{ (x\_2 - x\_3)(x\_1^2 - x\_2^2) - (x\_1 - x\_2)(x\_2^2 - x\_3^2) } \\ a &=
\\frac{y\_1 - y\_2 - b(x\_1 - x\_2)}{x\_1^2 - x\_2^2} \\ c &= y\_1 - a{x\_1^2} - bx\_1
\\end{align\*} \]

_We were unable to get an interview with David._

=== K - Knight Walk <posts-school-2021-hspc-k-knight-walk>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.knightwalk],
  [*Author*], [John Henke],
  [*Attempts*], [9],
  [*Correct*], [8],
  [*Percentage*], [15%],
  [*Concept*], [BFS on an implicit graph],
)

For this problem, you can use a breadth first search (BFS) to find the knight's
path. However, unlike a traditional BFS where you are given the full graph to
traverse, for this problem, you have an _implicit_ graph.

To do the BFS, first, you can create a _queue_ data structure and place the
starting position into it. Then, until the queue is empty, you pop off the front
of the queue. You can then look at every position the knight can reach from the
position you just popped off and add those to the back of your queue. Then,
repeat the process of adding moves to your queue and taking off the move that's
in front. Once you've found the square you were looking for, you can stop adding
moves to the queue, but it is important to finish processing whatever is still
left in the queue so you get all the paths!

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;8kF9dFtv4Qk&quot; title=&quot;CS@Mines HSPC 2021 Interview with John Henke (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with John Henke (Problem Author)]]

=== L - Math in Another Universe <posts-school-2021-hspc-l-math-in-another-universe>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.mathinanotheruniverse],
  [*Author*], [Mohammed Alnasser],
  [*Attempts*], [105],
  [*Correct*], [26],
  [*Percentage*], [47%],
  [*Concept*], [basic parsing and expression evaluation],
)

This problem is about finding a way to parse a mathematical formula. You can
start by splitting the formula on any spaces. You can then search the input for
any plus or minus signs. Once you find one, replace it and it's operands with
the result of the operation. When all of the plus and minus signs are gone, you
can do the same thing with multiplication and division signs. Once those are
gone, you should be left with a single number.

#html.blockquote[
\[!NOTE\]

There are ways to cheese this problem by adding parentheses and using your
languaguage's `eval` functionality, a trick which _The Fellowship of the
String_ found and enabled them to solve this problem 34 minutes into the
competition.

]

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;bVdkmqvTCuI&quot; title=&quot;CS@Mines HSPC 2021 Interview with Mohammed Alnasser (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Mohammed Alnasser (Problem Author)]]

=== M - Delivery Driver <posts-school-2021-hspc-m-delivery-driver>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines21.kattis.com/problems/mines21.deliverydriver],
  [*Author*], [Sumner Evans],
  [*Attempts*], [38],
  [*Correct*], [10],
  [*Percentage*], [18%],
  [*Concept*], [dynamic programming],
)

This problem requires
#link("https://en.wikipedia.org/wiki/Dynamic_programming")[_dynamic programming_], a
technique for optimizing _recursive_ algorithms. There are two main steps to
dynamic programming:

+ Find the recursive formulation.
+ Determine a strategy for storing previous calls to the recursive formulation
  so that you don't have to recompute values over and over again.

The following is a recursive formulation for the problem:

#html.blockquote[
\[!NOTE\] Recursive Formulation

Let (P(d, c)) be the maximum profit achievable through the rest of the
sequence by working in (c) on day (d), (p\[d, c\]) be the profit for day
(d) in city (c) from the table, (T(c\_1, c\_2)) be the transition cost from
(c\_1) to (c\_2), and (N) be the number of days. Then,

\[
\\begin{align\*}
P(N, c) &= p\[N, c\] \\
P(d, c) &= p\[d, c\] + \\max \\begin{cases}
P(d + 1, c) \\
T(c, c\_1) + P(d + 1, c\_1) \\
T(c, c\_2) + P(d + 1, c\_2)
\\end{cases}
\\end{align\*}
\]

]

The key insight from Dynamic Programming is that you can _cache_ the results of
(P) because (P) will need to be evaluated with the same parameters many
times. There are two main ways to make this cache:

+ By creating an (3 \\times N) table where the cells represent (P) evaluated
  at the corresponding day and city. Then, fill in the table in such a way that
  the dependencies are always evaluated before they are needed. In the
  recursive formulation above, the dependencies for (P(d, c)) are (P(d+1,
  c)), (P(d+1, c\_1)), and (P(d+1, c\_2)).
+ Via a technique called #link("https://en.wikipedia.org/wiki/Memoize")[memoisation]
  which involves creating a dictionary of function inputs to function outputs.
  Then, at the beginning of the function, check to see if the value has already
  been computed and is in the dictionary. If it is, then return that, otherwise
  compute the value, store it in the dictionary, and then return the value.

/* TODO twyla-convert: hugo shortcode: youtube id=&quot;r2nU-A74doQ&quot; title=&quot;CS@Mines HSPC 2021 Interview with Sumner Evans (Problem Author)&quot; */

#html.elem("details", attrs: ("class": "youtube-expander"))[#html.elem("summary")[CS\@Mines HSPC 2021 Interview with Sumner Evans (Problem Author)]]
