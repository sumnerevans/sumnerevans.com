// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Mines High School Programming Competition 2024",
  date: datetime(year: 2024, month: 4, day: 20),
  extra: (
    categories: ("School",),
    tags: ("High School Programming Competition", "Competitive Programming", "Mines", "HSPC"),
    math: true,
  ),
)
#show: page-template

For the last seven years, Mines ACM has hosted a High School Programming
Competition (HSPC) modelled after the
#link("https://icpc.global/")[International Collegiate Programming Contest (ICPC)]. I
wrote about the #link("https://sumnerevans.com./2019-hspc")[2019], #link("https://sumnerevans.com./2020-hspc")[2020],
#link("https://sumnerevans.com./2021-hspc")[2021], #link("https://sumnerevans.com./2022-hspc")[2022], and
#link("https://sumnerevans.com./2023-hspc")[2023] competitions on this blog. The problems from
every year are new and written by Mines students and some Mines alum
specifically for the competition. This year, I wrote two of the problems and
helped #link("https://ezrichards.github.io/")[Ethan Richards] with organizing the
competition.

This year, we returned to an in-person only competition, however we opened up an
open division to remote competitors. We also continued our open-internet policy
which allowed students to access internet resources.

New this year, we decided to give special awards for teams consisting of
exclusively first-time competitors.

We had sixteen different problems written by eleven authors (the highest number
of authors ever).

The in-person competition featured 27 teams which is lower than some previous
years, but still a great turnout. We expected more, but it turned out some had
signed up for the in-person competition when they wished to compete in the open
division.

In this post, I'm going to explain the problems in the competition (with
relatively detailed solution sketches).

*You can view full standings for each competition at the following websites:*

- In-Person: https://mines-hspc.kattis.com/contests/mines-hspc24
- Open: https://mines-hspc.kattis.com/contests/mines-hspc24-open

== The Problems <posts-school-2024-hspc-the-problems>

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

There were sixteen problems in the competition written by eleven different
authors (the most ever). The problems can be viewed at
https://mines-hspc.kattis.com/contests/mines-hspc24/problems. The following
lists the problems featured in the competition and a short description of the
algorithm required to solve the problem, listed in the order in which they
appeared in competition:

- *A: Parking Pandemonium* -- Basic arithmetic.
- *B: Closing Early* -- Modular arithmetic in a `for` loop.
- *C: Clock Catchup* -- Modular arithmetic related to time.
- *D: New Professor* -- Priority-queue or repeatedly sorted list processing.
- *E: Exact Change* -- Modular arithmetic.
- *F: Win Streak* -- List processing.
- *G: Winning Wagers* -- Expected value.
- *H: Warehouse Stocking* -- Dictionary and reverse-lookup dictionary.
- *I: Trolley Troubles* -- 0-1 BFS or Dijkstra's.
- *J: M-Climb Road* -- Basic arithmetic.
- *K: Purchasing Perishables* -- Finding optimal sequential-window size in a
  list.
- *L: Abby's Absolutes* -- Inequality check in a `for` loop.
- *M: Mines Motor Company* -- Manhattan distances in a `for` loop.
- *N: No Stragglers* -- Keep track of single variable state in a `for` loop.
- *O: QWERTY* -- Cipher based
- *P: Procrastination* --

The following subsections are going to describe the problems and provide fairly
detailed solution sketches for each one, sorted by their intended relative
difficulty with the easiest ones first.

I do not try and build up from first principles in each of these explanations.
Rather, I try and make the explanations accessible to anyone who feels like
solving the problem is within their grasp, but they can't figure out one or two
of the key ideas to crack the problem. For the easiest problems, I start much
closer to first principles, but as the problems get harder, I start assuming
more and more base understanding of programming.

Additionally, I'm only presenting a single solution for each problem here. There
are likely many alternative ways to solve many of these problems.

#html.blockquote[
\[!NOTE\]

Many of these problem solutions were written and edited by other people
including Kelly Dance, Shashank Bhatt, and Nathan George.

]

=== Parking Pandemonium <posts-school-2024-hspc-parking-pandemonium>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/parkingpandemonium],
  [*Author*], [Sumner Evans],
  [*In Competition*], [Problem A, 27/49 (55%) solved/tries, 100% solve rate],
  [*Concept*], [basic operations on variables],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Calculate the amount of times it takes for Hannah to find a parking spot given
that she circles the lot (C) times at (M) minutes per circle.

]

The solution is to read the first and third lines of input and multiply them.
The only difficult thing here is ignoring the second line of input which is the
temperature of the parking lot in Kelvin.

=== M-Climb Road <posts-school-2024-hspc-m-climb-road>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/mclimbroad],
  [*Author*], [Ethan Richards],
  [*In Competition*], [Problem J, 26/26 (100%) solved/tries, 96% solve rate],
  [*Concept*], [unit conversion + basic math],
)

#html.blockquote[
\[!NOTE\] Problem Summary

You walk along a road that is (5280 \\times W) feet long. You get sprayed
with water every (N) feet. You do not get sprayed at the start, but it
possible you could get sprayed exactly at the end.

]

Output (\\left\\lfloor\\frac{5280 W}{N}\\right\\rfloor).

The notation (\\left\\lfloor x\\right\\rfloor) means round down. This can be
accomplished by doing _integer division_ in most languages.

=== Abby's Absolutes <posts-school-2024-hspc-abbys-absolutes>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/abbysabsolutes],
  [*Author*], [Levi Sprung],
  [*In Competition*], [Problem L, 21/40 (52%) solved/tries, 78% solve rate],
  [*Concept*], [conditional within a loop],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Calculate the number of apples that Abby will buy in each of the (K) trips
to the store that she makes. Given that on the (i^{\\text{th}}) trip you want
her to buy (A\_i) apples, but she will buy either 1 or (N) apples on each
trip, whichever is closer to your request (or 1 in the case of ties).

]

Loop over each of the trips. During the (i^{\\text{th}}) trip, if (A\_i-1 \\leq
N-A\_i), then Abby will buy 1 apple, so print 1. Otherwise, she will buy (N)
apples, so print (N).

=== QWERTY <posts-school-2024-hspc-qwerty>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/qwerty],
  [*Author*], [Byron Sharman],
  [*In Competition*], [Problem O, 23/29 (79%) solved/tries, 85% solve rate],
  [*Concept*], [string transformation],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Riley typed some text with the keyboard "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
Translate this message to what it would be if she had typed using a
"QWERTYUIOPASDFGHJKLZXCVBNM" keyboard.

]

Create a map/dictionary to translate from each character typed using the ABCDEF
keyboard, to what it would be on a QWERTY keyboard. Build a new string by
passing each character through this map.

An alternative way to solve the problem is to create a string with the QWERTY
keyboard sequence. Then, for every character in the input, determine its index
in the normal alphabet (this can be accomplished by subtracting the ASCII value
for `'a'` from the ASCII value of the letter). Use that index to index into the
QWERTY sequence string and print that character.

=== Exact Change <posts-school-2024-hspc-exact-change>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/exactchange],
  [*Author*], [Jayden Pahukula],
  [*In Competition*], [Problem E, 25/31 (81%) solved/tries, 93% solve rate],
  [*Concept*], [modulo math (or repeated subtraction)],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Umbertoland has bill denominations 1, 5, 15, 30, 150. Express (N) dollars
using as few bills as possible.

]

The problem requires you to use a *greedy approach* that uses the largest
bills possible first. A _greedy approach_ means that you should make the locally
optimal decision without considering whether it's globally optimal.

The number of 150 dollar bills is (\\left\\lfloor\\frac{N}{150}\\right\\rfloor),
and update (N \\leftarrow N - 150 \\times
\\left\\lfloor\\frac{N}{150}\\right\\rfloor).

Repeat until you get down to the 1 dollar bills, and output your answer.

=== Win Streak <posts-school-2024-hspc-win-streak>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/winstreak],
  [*Author*], [Sumner Evans],
  [*In Competition*], [Problem F, 20/53 (38%) solved/tries, 74% solve rate],
  [*Concept*], [track longest contiguous sequence within a list],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Calculate the longest win streak over (N) games given the scores of your
team and the opposing teams.

]

You need variables to keep track of the _current win streak length_ and the
_maximum win streak length_. Then, for each game:

- If your team wins, increment the current win streak by 1.
- If your team ties or loses, check if the current win streak is longer than the
  maximum win streak. If it is, set the maximum win streak to the current win
  streak.

  Then, reset the current win streak to 0.


=== Clock Catchup <posts-school-2024-hspc-clock-catchup>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/clockcatchup],
  [*Author*], [Ethan Richards],
  [*In Competition*], [Problem C, 20/53 (38%) solved/tries, 74% solve rate],
  [*Concept*], [clock math],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Given a start time and end time of the same day, calculate how many times each
of the second, minute, and hour hands move onto the 12.

]

Let (H\_s, M\_s, S\_s) and (H\_e, M\_e, S\_e) be the hour, minute, and second of
the start time and end time, respectively.

The hour hand cross once if (H\_s \< 12 \\leq H\_e), otherwise it does not cross
at all.

The minute hand crosses (H\_e-H\_s) times.

The second hand crosses (60 \\times (H\_e - H\_s) + (M\_e - M\_s)) times.

=== No Stragglers <posts-school-2024-hspc-no-stragglers>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/nostragglers],
  [*Author*], [Keenan Schott],
  [*In Competition*], [Problem N, 22/25 (88%) solved/tries, 81% solve rate],
  [*Concept*], [track a single variable in a loop],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Given security logs for number of students, faculty, and visitors entering or
exiting Mines Market, determine if there are still people inside, and if so,
how many?

]

Notice that the distinction between students, faculty, and visitors is
irrelevant to the problem and can be ignored.

Initialize some variable to 0 that will be used to track how many people are
currently in Mines Market. Now process the logs sequentially, for `IN` events,
add to the total, and for `OUT` events, subtract from the total.

If at the end the total is 0, output `NO STRAGGLERS` otherwise output the total.

=== Purchasing Perishables <posts-school-2024-hspc-purchasing-perishables>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/purchasingperishables],
  [*Author*], [Nathan George],
  [*In Competition*], [Problem K, 6/53 (11%) solved/tries, 22% solve rate],
  [*Concept*], [determining the optimal step-length within an array],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Given a list of meal prices for (N) days, find an optimal interval for Katie
to purchase (N) meals such that the total cost is minimized, and output this
minimum cost.

]

The solution is to try each potential purchasing interval from 1 to (N) days
and compute the cost of meals for that interval. If the interval is (k) days,
then the cost can be expressed as:

\[ \\sum\_{i = 0}^{\\left\\lceil \\frac{N}{k} \\right\\rceil - 1} p\_{i \\cdot k + 1}
\\cdot \\min(k, N-i \\cdot k) \]

But (N) can be as large as (10^5). Is this fast enough?

Yes, for each interval length (k), we can compute its cost in
(\\mathcal{O}\\left(\\frac{N}{k}\\right)) time. Then, the total time to compute
the cost over all intervals is

\[ \\sum\_{k = 1}^{N} \\frac{N}{k} \]

We can show that this runs in (\\mathcal{O}\\left(N \\log (N)\\right)) with the
following comparison:

\[ \\sum\_{k = 1}^{N} \\frac{N}{k} \\approx \\int\_{1}^{N} \\frac{N}{x} dx = N \\ln(N)
\]

=== Closing Early <posts-school-2024-hspc-closing-early>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/closingearly],
  [*Author*], [Kelly Dance],
  [*In Competition*], [Problem B, 11/84 (13%) solved/tries, 41% solve rate],
  [*Concept*], [modular arithmetic in a loop],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Each pizza has (S) slices. There are (R) slices ready. (N) customers
will arrive sequentially and the (i^{\\text{th}}) customer will order (A\_i)
slices. When is the earliest time we can stop serving customers and have 0
slices left over?

]

We want to find the first (k \\geq 0) where (A\_1 + A\_2 + ... + A\_k = R + fS)
for some other integer (f) representing the number of full pizzas cooked. To
do this we consider both sides of this equation modulo (S):

\[ (A\_1 + A\_2 + \\dots + A\_k) \\mod S = R. \]

To find (k) we can maintain a running total (T). Now, we can loop over the
customers until (T = R). With each customer we update (T \\leftarrow (T + A\_i)
\\mod S).

Be careful about the (k=0) case, or the case when there is no such (k).

This solution runs in (\\mathcal{O}(n)) time. (\\mathcal{O}\\left(n^2\\right))
solutions are too slow.

=== Winning Wagers <posts-school-2024-hspc-winning-wagers>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/winningwagers],
  [*Author*], [Umberto Gherardi],
  [*In Competition*], [Problem G, 14/45 (31%) solved/tries, 51% solve rate],
  [*Concept*], [expected value],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Given a set of (N) _probability items_ (coin, die, cards) and the amount of
money you would lose if you incorrectly predict their outcomes, calculate the
break-even point for the wager.

]

Let (T\_i) be the number of possible outcomes for the (i^{\\text{th}}) event.
The probability of correctly predicting all (N) events is:

\[ \\frac{1}{D} = \\prod\_{i=1}^{N} \\frac{1}{T\_i}. \]

Note that since all (T\_i) are integers, (D) is also an integer. Then set the
_expected value_ of the wager to (0):

\[ \\frac{1}{D} \\times W - \\left(1 - \\frac{1}{D}\\right) \\times L = 0. \]

Solving for (W), we get:

\[ \\begin{align\*} \\frac{1}{D} \\times W - \\left(1 - \\frac{1}{D}\\right) \\times L &
= 0 \\ \\frac{1}{D} \\times W & = \\left(1 - \\frac{1}{D}\\right) \\times L \\ W & = D
\\times \\left(1 - \\frac{1}{D}\\right) \\times L \\ W & = (D - 1) \\times L.
\\end{align\*} \]

Importantly, this calculation _does not require any division_. No floating point
math necessary.

If you attempted to use an equation that included division, you would likely
have run into precision issues with your calculations.

=== Warehouse Stocking <posts-school-2024-hspc-warehouse-stocking>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/warehousestocking],
  [*Author*], [Ethan Richards],
  [*In Competition*], [Problem H, 7/61 (11%) solved/tries, 26% solve rate],
  [*Concept*], [multiple dictionaries],
)

#html.blockquote[
\[!NOTE\] Problem Summary

You are given a set of `PUT`, `TAKE`, and `FIND` operations on a warehouse.
For all `FIND` operations, output all of the locations of the item being
searched for in the warehouse.

]

The key here is to have _two_ dictionaries: one to store a mapping of locations
to the item they contain ((L)), and another to store a mapping of items to a
list of the locations in which that item can be found ((T)).

Then, it's a matter of accounting for the state updates caused by each
operation.

- For each of the `PUT` operations, update (L\[\\texttt{loc}\] \\leftarrow
  \\texttt{item}) and (T\[\\texttt{item}\] \\leftarrow \\text{append } \\texttt{loc}
  \\text{ to } T\[\\texttt{item}\]).
- For each of the `TAKE` operations, update (T\[L\[\\texttt{loc}\]\] \\leftarrow
  \\text{remove } \\texttt{loc} \\text{ from } T\[L\[\\texttt{loc}\]\]) and set
  (L\[\\texttt{loc}\] \\leftarrow \\text{nil}).
- For each of the `FIND` operations, if (T\[\\texttt{item}\]) exists, sort and
  output it. If it does not exist, output `NOT FOUND`.

=== Procrastination <posts-school-2024-hspc-procrastination>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/procrastination],
  [*Author*], [Ethan Richards],
  [*In Competition*], [Problem P, 13/39 (33%) solved/tries, 48% solve rate],
  [*Concept*], [greedly simulation],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Kelly has (M) hours to complete some tasks. Task (i) takes (T\_i) hours
and will increase his grade by (G\_i). Kelly opts to complete the shortest
tasks first. He will break ties by picking the task with the greater grade
points. What will be the total benefit to his grade?

]

Sort the tasks by increasing (T\_i) and break ties with decreasing (G\_i).
This can be done using a built in sorting algorithm on pairs/tuples if (G\_i)
is placed second in the tuple and negated.

Initialize (F=0) to track his total grade. Now loop over the tasks with this
new order as long as (M \\geq T\_i). For each task update (M \\leftarrow M -
T\_i) and (F \\leftarrow F + G\_i).

Output the final grade (F).

*Note:* the reason we did not ask for the _optimal_ set of tasks to preform to
optimize the grade is because that is an
#link("https://en.wikipedia.org/wiki/NP-completeness")[NP-complete problem] which means
that it's provably a hard problem.

=== Mines Motor Company <posts-school-2024-hspc-mines-motor-company>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/minesmotorcompany],
  [*Author*], [Meta Saka],
  [*In Competition*], [Problem M, 19/19 (100%) solved/tries, 70% solve rate],
  [*Concept*], [Manhattan distance in a loop],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Given a sequence of locations to visit on a 2D grid of workstations, calculate
the total distance you must travel.

Locations are given in order as 2-character strings. Examples: `AA` represents
((1,1)), `ZA` represents ((26,1)), `GX` represents ((7,24)).

]

Loop over locations starting from the second location (since the first is the
starting location).

Now we want to add up the distance between successive pairs of locations.
Convert the characters for the X direction of each location to a number 1-26 (or
ASCII), then take the absolute value of their difference and add this to the
total distance. Repeat for the Y direction.

=== Trolley Troubles <posts-school-2024-hspc-trolley-troubles>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/trolleytroubles],
  [*Author*], [Jonathon Robel],
  [*In Competition*], [Problem I, 0/14 (0%) solved/tries, 0% solve rate],
  [*Concept*], [0-1 BFS or Dijkstra's on a non-trivial graph],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Given a map of (N) parallel (L)-length tracks with cracks, find a path
that minimizes the number of cracks crossed.

]

This is a graph modelling problem. We want to construct a graph such that
finding the shortest path provides us with a path through the tracks that
minimizes the number of cracks crossed.

- *Nodes* are track segments ((N \\times L) total) labeled ((t,s)) where
  (t) is the track number and (s) is the segment number.
- *Edges* are decisions we can make at each track segment (move forward or
  switch tracks)
- *Edge Weights* are the number of cracks crossed to go to the next track
  segment (0 if no crack or 1 if there is)

For each node ((t, s)), create the following edges depending on the segment
type of ((t, s)):

- `=` pieces - create an edge to ((t, s+1)) with weight 0.
- `H` pieces - create an edge to ((t, s+1)) with weight 1.
- `^` pieces - create an edge to ((t, s+1)) and an edge to ((t-1, s)) both
  with weight 0.
- `v` pieces - create an edge to ((t, s+1)) and an edge to ((t+1, s)) both
  with weight 0.

It may be helpful to create a singular _finish_ node that all ((t, L)) nodes
have a zero-cost edge to. This allows you to find the shortest path to a single
node.

Now, we need to actually find a path through the graph from ((k,0)) to the
finish node. There are a couple ways to do this:

- #link("https://en.wikipedia.org/wiki/Dijkstra's_algorithm")[*Dijkstra's Algorithm*] -
  This algorithm uses a priority queue to visit nodes in a uniform manner
  radiating from the start node.
- *0-1 BFS* - This algorithm performs a normal BFS with the following
  modifications:

  - Use a deque (double-ended queue) instead of a queue.
  - If the edge has weight 1 enqueue to the _back_ of the deque, if the edge has
    weight 0 enqueue to the _front_ of the deque.
  - When updating the distance matrix, use the edge weight rather than
    hard-coding 1.


In both algorithms, you need to track the node from which each node is
discovered, then perform a *traceback* from the finish node to construct the
path.

If the parent of a node ((t, s)) is ((t-1, s)), then the path will include
(s\\texttt{d}) indicating a downward switch at column (s). The parent has a
lower track number than its child, meaning that it is _above_ the child node.

Conversely, if the parent of a node ((t, s)) is ((t+1, s)), then the path
will include (s\\texttt{u}) indicating an upward switch at column (s).

You will have to perform the traceback starting from the finish node, and output
in the _reversed_ order.

=== New Professor <posts-school-2024-hspc-new-professor>


// TODO twyla-convert: check table styling
#table(
  columns: 2,
  table.header([], [], ),
  [*Description*], [https://mines-hspc.kattis.com/contests/mines-hspc24/problems/newprofessor],
  [*Author*], [Mete Saka],
  [*In Competition*], [Problem D, 9/38 (24%) solved/tries, 33% solve rate],
  [*Concept*], [priority queue or repeated sorting of an array],
)

#html.blockquote[
\[!NOTE\] Problem Summary

Blake has (S\_i) shirts of the (i^{\\text{th}}). He wants to avoid wearing
the same color shirt multiple times within the same work week (5-day weeks).
How many days can he go before he must wear a shirt color he has already worn
that week, or he runs out of shirts?

]

We will simulate choosing which color shirts to wear each week. When choosing
the colors for a week, we will pick the 5 colors that have the most shirts
remaining. Remember to update the number of remaining shirts of these colors.

When there are (k \< 5) distinct shirt color remaining, we can go exactly (k)
more days before finally repeating our self or running out of shirts.

This approach can be made to run in (\\mathcal{O}(CM\\log(C))) where (M) is
the maximum number of any shirt color and (C) is the number of shirt colors by
utilizing a priority queue, but we set the bounds low enough that repeatedly
sorting the shirt color frequency list would still be fast enough
((\\mathcal{O}(C^2M\\log(C)))) assuming an (\\mathcal{O}(n \\log n)) sorting
algorithm is used.
