---
title: 7 Things I've Learned After 7 Years as a Software Engineer
date: 2025-07-06T06:25:00-06:00
categories:
  - Hackathons
  - Programming
tags:
  - Hackathon
  - Career
description: |
  In this article, I share seven things that I've learned to do seven years into
  my career as a software engineer.
build:
  publishResources: false
math: true
---

A few months ago, I was asked to give the keynote address at the BlasterHacks
hackathon hosted at Mines by their [ACM](https://acm.mines.edu/) chapter. I
wasn't quite sure what would be interesting to talk about for the keynote, so I
asked some friends. [Byron](https://byronsharman.com/) suggested that I either
talk about hackathon advice or career advice. Since I was giving a hackathon
keynote, I decided to focus my presentation on hackathon advice. I went to six
hackathons while I was a student at Mines, and won prizes at all but one of them
so I felt I had something interesting to say about the topic.

I came up with the following seven things that I thought would make the
students' time at the hackathon worthwhile:

1. Focus on the Customer
2. Solve Problems That Actually Exist
3. Build Core Features First
4. Don't Prematurely Optimize
5. Learn Something New
6. Support Your Teammates
7. Have Fun

As I started thinking about these seven items, I realized that in actuality
**these are things that you should do and work on improving for your entire
career**. Proficiency in these things are a big part of what differentiates
senior engineers from junior engineers.

During the hackathon keynote, I focused on how to apply these seven things in a
hackathon context, but in this article, I'm going to focus on how they apply to
your career more broadly.

## 1. Focus on the Customer

Every software project has a customer. It might just be you. It might be
millions of end-users who download your app. It might be a niche set of small
business owners. It might be local governments (as is the case at my
[current job]({{<ref"../../../portfolio/index.html#experience-canam-tech-lead">}})).
It might be another team within your organization.

Whoever your customer is, let them guide you. Whenever you aren't sure how to
proceed, figure out what the customer wants. Ideally, you would do this by
directly talking to the customer, but sometimes this is not possible and you
just have to put yourself into their shoes.

The users of your product are not necessarily your customers. This is especially
the case for startups where your customer is the investors, not your users. Most
investors want to see the userbase increase, which is normally correlated with
serving the users well, so focusing on the user is still a good proxy for
serving the customer well.

If you aren't sure who your customer is, figure out who is paying the bills.
**Whoever is funding your salary is your customer.** Figuring this out requires
you to understand the business model of your company. Ideally, the leadership of
the company you work for will clearly articulate this. However, within large
organizations, the customer can often become obscured by layers of bureaucracy
and management indirection and abstraction. Sometimes it gets to the point where
nobody can clearly articulate the customer that certain teams within the
organization actually serve. Sometimes a theoretical customer is communicated,
but it's important to determine if that theoretical customer actually exists.

If you realise that your team's customer's doesn't exist (either because nobody
can clearly articulate who the customer is or you realise that the theoretical
customer you are serving doesn't exist), I'd start making escape plans. When
evaluating teams to join or move towards, I'd think primarily about their
proximity to the money spicket. You want to work on a team that is a profit
centre, not a cost centre.

## 2. Solve Problems That Actually Exist

After you know your customer, you need to solve an actual problem they have. A
lot of times, us engineers like to solve problems that we think people have
without actually taking the time to understand if they actually have that
problem. **Any time spent solving a nonexistent problem is time wasted.**

Unfortunately, it is often rare that the direct problems that engineers _want_
to solve are actually problems that need to be solved. For example, you most
likely don't need to optimize your web application's load time by 10% because
most of your users are on horrible internet already. However, sometimes you can
reframe the problem in terms of something that the customer or business actually
cares about. For example decreasing app load time could impact user retention or
clickthrough rate, or a major refactor could decrease development cost of new
features.

Thinking in terms of the actual problem the customer has, and demonstrating that
the technology changes that you are responsible for move the needle on those
metrics is what people mean when they say that they want to measure "impact".

## 3. Build Core Features First

Once you have an actual problem that an actual customer has, you need to solve
it. It is important at this point to think of the minimal thing that could move
the needle for your customer: that is what you should implement.

Even if you know the entire scope of the product you need to create (maybe it's
a contract for a customer), **you should still start with an MVP for one
important reason: de-risking the project**. In any project, there are known
unknowns and unknown unknowns. It is important to uncover the unknown unknowns
as fast as possible, and building an MVP is the fastest way to accomplish this.

In doing so, you will identify missing dependencies from the design and be able
to sort out any contradictions in the design. Importantly, if you find an
unknown unknown, it is imperative that you communicate it with the rest of the
team. It is not a failure if you find something that blows up the scope of a
project, it is a failure if you don't surface it to the decision makers as soon
as possible. In healthy engineering cultures, identifying risk is rewarded, and
corrective actions are taken by the project managers to account for the newly
identified risks.

The next step is to propose solutions which will mitigate the risk, or eliminate
it entirety. Maybe if certain requirements are changed or eliminated, the risk
goes away. Maybe prototyping a technical solution for a few days is necessary to
allow technical decision makers to understand the scope of the risk. Maybe if
the problem is reframed, the problematic requirements aren't even requirements
any more.

Identifying technical risk and proposing mitigations are some of the most
important contributions of an engineer to an organization. I think that this is
something that LLMs are especially bad at, and will be immune to the AI
revolution for quite a while. LLMs easily fall for context pollution and become
yes-men. Being able to say "no" and advocate for your opinion is a uniquely
human characteristic.

## 4. Don't Prematurely Optimize

In modern software, there are rarely explicit performance requirements. And
while care should be taken to not write horribly inefficient code, algorithmic
complexity is rarely a concern. This means that using a slightly less optimal
algorithm that allows you to create more readable and writeable code is worth
it. **It is almost always better to optimize for write-time over runtime.**

I like optimizing code as much as the next guy, but often I realize that \(n\)
is so small as to be negligible. Most projects are not _big data_. Doing an
\(n^2\) algorithm on a dozen items instead of using a hashmap is totally fine.

However, "don't prematurely optimize" does not mean "don't optimize at all". It
means that you should optimize things which you have identified as actual
bottlenecks. Sometimes due to past experience you know that a certain thing will
be a bottleneck (SQL queries that join in a specific way to a table, or number
of requests to a slow external service, for example). In those cases, it's fine
to optimize right away. But if you just _think_ that it might be a performance
problem, it's better to do the most straightforward and readable thing first and
loop back to performance if it becomes a problem.

## 5. Learn Something New

The software engineering industry is constantly changing, and software
practitioners are required to keep up with the change. Additionally, you need to
be constantly upskilling yourself in nontechnical areas such as communication.

It is easier to keep up with change now than at any other time: there is a
plethora of YouTube channels, podcasts, and newsletters which can help you build
your technical knowledge. I'm a fan of the [Changelog](https://changelog.com/)
and [Coder Radio](https://coder.show/) podcasts in particular, and obviously
[The Primeagen](https://www.youtube.com/@ThePrimeTimeagen). I do not, however
believe it's necessary to learn every single new framework or technology. A lot
of knowledge in a specific domain will be transferable to another domain (it's
all bits and CPU instructions at some point).

Additionally, it's important to learn from your coworkers. Read lots of code
from more other engineers to learn their approaches. Even as a senior engineer,
junior engineers might surprise you with a novel approach to a problem.

Recently, with the LLM revolution, finding ways to integrate AI into your
workflows and understand the limitations of its usefulness has become an
important part of a software engineers toolbox. I will admit that I have no
suggestions here as I am still not great at using AI. My usage is limited to
GitHub Copilot or other autocomplete AIs right now. I also am not convinced that
allowing junior engineers to use AI is a good thing, because they have not yet
tuned their "code reading" skills enough to know if what the AI produces is any
good. At this point, I think that AI makes you faster at what you already were:
it makes junior engineers faster at being junior (and making junior mistakes)
and it makes senior engineers faster at being senior.

## 6. Support Your Teammates

When I gave the BlasterHacks keynote three months ago, I had yet to start my
[new job at Can/Am Technologies]({{<ref"../../life-updates/joining-canam/index.md">}})
where I'm a tech lead. My only experience with supporting teammates was in the
context of hackathons and helping coworkers at my previous jobs. However, many
of the things that I'm doing as a tech lead were things that I expected to be
doing, and correlated at a larger scale with things that I had learned from my
hackathon experience. At the keynote, I mentioned three things that I thought
were important:

1. **Check in on each other.** Making sure that your coworkers are doing well is
   important. As a manager, this has become even more important: I have found
   1:1s extremely valuable and I have really enjoyed the opportunities to learn
   from and support my team one-on-one.

2. **Make sure your teammates are not blocked, don’t be afraid to put two brains
   together to solve hard problems!** I have learned that removing my team's
   blockers is one of the highest leverage things that I can do. There have been
   multiple times where just a quick conversation got a coworker over a hurdle
   or allowed me to identify a future hurdle that they would encounter. I've
   also found it extremely valuable to spend time designing prototypes
   collaboratively.

   As a lead, I have ultimate responsibility for ensuring that the entire team
   is successfully delivering for the customer, not just for my own delivery.
   When a team-member is blocked, they are not delivering for the customer, and
   thus **I** am not delivering for the customer.

3. **Make sure your teammates take care of themselves, it’s a marathon, not a
   sprint!** It is easy to work yourself to burnout in software engineering. It
   is important to personally work sustainably, and helping your teammates work
   sustainably is equally important.

   There was a
   [recent fallthrough episode](https://fallthrough.transistor.fm/19) in which
   this topic came up and Evan Phoenix said that one of the secrets to having a
   sustainable career is "working at 70%". I recommend listening to that part of
   the episode (starting around 1:07:00).

Since then, I've learned a few things about being a tech lead that I didn't
expect, but are pretty obvious when I think about them.

- **You have \(n+1\) bosses, your manager, and your direct reports.** I now have
  tasks coming from both my manager as well as my direct reports. I'm obviously
  happy that I'm able to serve my direct reports and help them in any way I can,
  but the bi-directional nature of my responsibilities was more surprising than
  it should have been.

- **Administrative and managerial tasks are actually your job now, not just
  distractions from your job.** I have had to learn that this is OK. Days where
  you don't write code are not wasted. In fact, they are often
  force-multiplying. Sometimes, there are days that are just 1:1s, design
  reviews, and strategy syncs and those days are just as valuable as the days
  where I'm able to code most of the day.

## 7. Have Fun

Some people see software engineering as just a job, and that is OK. But if you
want to make it a full career, and truly excel in the field you need to derive
enjoyment and fulfilment from your work.

This is a journey that you have to make on your own, but I will tell you what I
have found creates fulfilment in my life. There are two main things:

1. **Customer impact.** I love being able to see the software that I write
   impact customer's lives positively. When I was
   [at Beeper]({{<ref"../../../portfolio/index.html#experience-beeper">}}),
   there were a few times where I met users in the wild at conferences, and I
   interacted via public Matrix rooms with many other users. I also interacted
   directly with users via our support rotation and even built out tools to
   support that effort.

   In my current position
   [at Can/Am]({{<ref"../../../portfolio/index.html#experience-canam-tech-lead">}})
   I've had the opportunity to go on-site to one of our clients and get to see
   them utilize our software. It is really awesome to see the software I've
   helped write allow them to accomplish their goals.

2. **Great teammates.** I place a high premium on good teammates. I feel like
   with a good team, anything is possible. At Beeper, I was especially proud of
   how the team came together to build
   [Beeper Mini](https://blog.beeper.com/2023/12/05/introducing-beeper-mini-get-blue-bubbles-on-android-%f0%9f%92%99/)
   which was a stunning success for a few days before Apple killed it. I truly
   believe that the Beeper team is still the best team in the chat space. I was
   sad to leave that team, and I have confidence that they will be able to
   continue delivering a great product.

   Already at my new job I've seen my team come together to meet difficult
   deadlines and navigate even more difficult vendor relationships to deliver
   for clients. I am excited that I have an opportunity to have more influence
   over the shape of my team, and help them to reach their potential.

An ideal job for me has both of these things, and having only one is fine for a
short amount of time. Having neither is a recipe for me quitting.

---

So there you have it: my list of seven things I've learned seven years into my
software engineering career. (I kinda cheated and counted internships as one
year worth of experience, just because it made the title way better.)

I know that I'm still very junior compared to many people in this industry, and
I have much more to learn. I'm fortunate to have had many role models throughout
my career who have guided me by example and admonition. On the other hand, I
also recognise that I've come a long way from the little high-school intern I
was a decade ago. Maybe my perspective is valuable to somebody who is just
starting their career, and maybe it's even valuable for a more senior person to
remember some of the things they've learned along the way as well.
