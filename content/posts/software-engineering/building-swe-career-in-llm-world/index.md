---
title: Building a Software Career in an LLM World
date: 2025-08-16T06:25:00-06:00
categories:
  - Software Engineering
tags:
  - Staff Engineer
  - Career
  - Tech Lead
unlisted: true
---

> [!ABSTRACT] TL;DR
>
> Getting an entry-level software _job_ is harder now than at any time in at
> least the last decade.
>
> Building a _career_ in software is (and always has been) hard, but highly
> rewarding if you succeed.
>
> The key is to take **ownership** of both your work and your career trajectory.

In this article, I am going to discuss how to build a career in the software
industry. We will explore [career tracks](#career-tracks), and discuss the
[attributes needed to
become a senior software engineer](#making-senior-software-engineer-and-beyond).
Then I will provide my view of
[how LLMs will affect the software engineering
industry and job market](#how-llms-affect-career-tracks).

<!--more-->

The intended audience of this article is computer science students and junior
engineers, as those are the people who I think can benefit the most from this
information. However, I think that the things I discuss may be useful to anyone
who wants to achieve senior level and beyond in their software engineering
career.

I also recognise that I'm not very far into my career. I graduated in 2019, and
just became a
[tech lead]({{<ref"../../../portfolio/index.html#experience-canam-tech-lead">}}).
However, I've been fortunate to be able to work under some great managers, and I
have worked with some amazing software engineers and architects throughout my
career. Thus, I think I am reasonably qualified to discuss the path to senior
engineer, but I'm still on my own career journey past senior engineer.

> [!CAUTION] Disclaimer
>
> I make a lot of unsubstantiated predictions in this article. They are not
> backed by much more than a gut feeling. However, I think that even if my
> predictions are incorrect, if you follow the advice in this article, the
> chances that you will have a successful career in software engineering will be
> greatly increased.

## Eyes on the Goal

The first thing to think about is **what is a career?** I think everyone
intuitively understands that having a job is different than having a career: a
job is just what you do to make money, but a career is your vocation,
profession, and life-work. Jobs come and go, but a career transcends the
particular jobs you do.

Most people want a career, but I think that most of the advice people give to
young people is geared towards getting a job. Part of this is likely a residue
of the postwar economy where it was common for people to get a low-level job at
a company and stay there for their entire career. Career paths were mostly
determined by the company you worked for. Upwards mobility within companies was
created due to companies valuing internal promotions, and increased efficiencies
from technical innovation delivered real wage increases even to those who were
not promoted.

The modern economy is much different. Any notion of companies being loyal to
their employees is gone. It's every-man-for-himself out there, and you have to
take responsibility for your own career. **Nobody cares about your career as
much as you do.** There are of course people whose own motives are aligned with
your career growth. Your manager wants to provide growth opportunities so you to
stay at the company so their retention numbers don't look bad. Your parents want
you to be successful so that they can brag to their friends about how successful
their children are. Your significant other probably cares too (but I have no
experience with that due to
[reasons]({{<ref"../../life-updates/on-being-gay.md">}})).

So, you've want a career in software engineering, not just a software job, but
what does a software engineering career actually look like?

## Career Tracks

Your career is your own adventure, but that doesn't mean that you have to find
your path on your own. The standard progression for software engineers is fairly
straightforward: entry-level -> mid-level -> senior. At most companies, Senior
Engineer is considered a _career level_ position meaning that you are not
expected to pursue promotion to a higher rung of the career ladder.

However, there are of course opportunities past Senior Engineer that you can
pursue. The following illustration from
[staffeng.com](https://staffeng.com/guides/overview-overview/) illustrates the
two main tracks available to software engineers past the senior engineer level.

{{<figure
  src="images/levels.png"
  alt="The two post-senior career paths are staff-plus and engineering management."
  title="There are two main tracks available to software engineers post-senior level"
  attr="Staff Engineer: Leadership beyond the management track"
  attrlink="https://staffeng.com/guides/overview-overview/">}}

Both tracks start out the same: getting from entry-level to senior. From there,
engineers can choose to remain an _individual contributor (IC)_ and pursue the
staff-plus track or _engineering management_ which constitutes a classical
management pipeline. In a lot of other industries after you get to a certain
point you have to go into management to continue advancing in your career. We
are fortunate to be in an industry where management is not the only opportunity
for career advancement. Not all companies have established career ladders like
what is described in the diagram, but the principles apply across companies.

Regardless of what you want achieve, making Senior Engineer is the first step.
**In my opinion, your goal should be to making Senior Engineer within five years
of entering the industry.** And I don't mean just getting the title of Senior
Engineer. There is a lot of title inflation meaning that there are lots of
"senior" engineers running around who do not perform at a senior level.
Additionally, many companies like startups or other small businesses don't have
specific titles, so you may be performing at a senior level without having a
corresponding title.

> [!QUOTE] Your goal should be to make Senior Engineer as fast as possible

Anecdotally, I know many graduates who have not made senior level in a timely
manner and many of them are no longer in the industry, or have struggled to stay
employed in it. On the other hand, I also know many people who have made senior
level and beyond very quickly and they have been able to leverage their
competence for promotions, offer negotiations, and other opportunities.

## Making Senior Software Engineer and Beyond

So, you know you need to become a senior software engineer, but what
differentiates a senior engineer from a junior one? In my opinion, there is a
single word that summarises the attributes that differentiate senior engineers
from junior engineers: **ownership**.

Most established engineering organisations have criteria for every software
engineering level. Such organisations create _engineering competency matrices_
which describe the expectations of engineers at every level across a variety of
metrics. The Circle CI team
[made their engineering competency matrix public](https://circleci.com/blog/why-we-re-designed-our-engineering-career-paths-at-circleci/)
and so we will use that as a guide.

The
[Circle CI Engineering Competency Matrix](https://docs.google.com/spreadsheets/d/131XZCEb8LoXqy79WWrhCX4sBnGhCM1nAIz4feFZJsEo)
has an
[associated FAQ](https://drive.google.com/file/d/1F3xzmbdsMvfDZwZesvxcEIIBn2TmI4sg/view)
which describes how competency scales through the engineering levels:

- **Competencies scale through areas of influence / impact**: own work on task
  -> epic -> project / milestone / team -> across teams -> engineering
  organisation -> company
- **Competencies scale through increased frequency**: sometimes -> usually ->
  always demonstrating a competency

The higher you go in an engineering organisation, the more impact your work is
expected to have, and the greater amount of ownership mentality is required to
perform at that level.

Let's look at a few examples:

- **Technical Skills -> Security.**

  - Junior: Understands the importance of security.
  - Mid-Level: Understands the importance of security. Utilizes this knowledge
    to ask more senior engineers for help on making decisions that may have
    security implications.
  - Senior: Approaches all engineering work with a security lens. Actively looks
    for security vulnerabilities both in the code and when providing peer
    reviews.
  - Staff: Actively works with the security team, as well as their own team, to
    refine their team's approach to security based on the organisation's
    security strategy. Fosters a security first mindset within their own team,
    and leads by example.
  - Senior Staff: Actively works with the security team, as well as across
    several teams, to apply the organisation's security strategy. Fosters a
    security first mindset across those teams, leading by example.
  - Principal: Actively works with the security team to set and refine
    organisation wide security strategy. Fosters a security first mindset across
    the organisation. Can recognize obscure security threats that go unnoticed
    to others.

  The higher up in the engineering organisation you get, the greater the
  expected level of _ownership_ over the security of the products being produced
  by the organisation. To move past junior engineer, you need to **take
  responsibility for the security of the code you write**. The faster you start
  proactively asking the correct questions about security, the better.

- **Leadership -> Process Thinking**

  - Junior: Understands their team's practices and processes.
  - Mid-Level: Sometimes thinks about team practices and processes and discusses
    improvements with team.
  - Senior: Regularly thinks about team practices and processes and discusses
    improvements with team.
  - Staff: Thinks about team practices and processes and regularly discusses
    improvements with their team. Sometimes collaborates with others to improve
    organisational practices and processes.
  - Senior Staff: Thinks about practices and processes that affect several
    teams, discusses improvements with appropriate parties, and drives
    implementation. Usually collaborates with others to improve organisational
    practices and processes.
  - Principal: Takes ownership and responsibility for organisational practices
    and processes and their continuous improvement.

  Once again, the higher up in the engineering organisation you get, the greater
  the expected level of _ownership_ over the processes utilised across the
  organisation. To move past junior engineer, you need to **take responsibility
  for utilising the existing processes, understand why they are the way they
  are, and discussing what improvements could be made**. As with security, the
  faster you start proactively asking the correct questions about process, the
  better.

As we can see from both of these examples, the best thing that you can do as a
junior engineer is ask questions. Ask why certain coding practices are
considered better than others by your organisation. Ask why certain strategic
initiatives are prioritised by the organisation. Ask why certain processes are
utilised within the organisation.

> [!IMPORTANT] It's OK to not know. That's why you're junior, not senior!

Asking questions as a junior engineer demonstrates that you care about the work
you are doing. _Caring about the work you have been tasked with_ is the most
important attribute that you can demonstrate as a junior engineer. You should
care about how your task aligns with your team's goals. You should care about
how your team's goals align with the organisation's and company's goals. You
should care about how your organisation/company goals impact the customer of
your product. By caring early in your career and asking the right questions,
when you are required to care about a team- or organisation-level objective as a
senior engineer, you will have already practised the necessary skills to direct
your work.

> [!IDEA] Key Idea
>
> Software produced by people who care about the software they write will always
> be better than software produced by people who don't care, regardless of how
> the code is written.

There is a lot more to explore here. I highly encourage you to spend some time
reading engineering competency matrices, reading or listening to staff-plus
engineers, and learning from more senior people how they got to where they are.

If you're a fan of long-form interviews,
[Ryan Peterman](https://www.youtube.com/@RyanLPeterman) is a good resource. He
is a staff engineer and interviews other staff-plus engineers about their
careers. If you like blogs and books, [staffeng.com](https://staffeng.com/) by
[Will Larson](https://lethain.com/) is the seminal resource on engineering at a
staff-plus level.

## How LLMs Affect Career Tracks

I'm an LLM skeptic. Specifically, I'm skeptical of the business models of the
LLM companies, and I think that the claims that LLMs alone (or generative AI
[GenAI] more broadly) will get us to AGI are highly dubious. I don't think we
are
[a few thousand days from AGI](https://arstechnica.com/information-technology/2024/09/ai-superintelligence-looms-in-sam-altmans-new-essay-on-the-intelligence-age/),
and I think the efficiency gains that organisations are experiencing by using
LLMs and other generative AIs are being exaggerated. Companies have an incentive
to say that they are getting efficiency gains from AI because it looks good on
Wall Street and gives them an excuse for workforce reductions that they wanted
to do anyway.

We have yet to see any company make a profit from generative AI itself, or even
demonstrate a viable path to profitability. For example, despite charging
$200/mo for ChatGPT Pro, OpenAI is losing money on the product due to the high
inference cost of serving each request. Inference and training are both
extremely energy intensive, to the point that
[Microsoft is reopening the Three Mile Island nuclear power plant to power its
datacenters](https://www.npr.org/2024/09/20/nx-s1-5120581/three-mile-island-nuclear-power-plant-microsoft-ai).

All this is ignoring the harmful nature of content that GenAI is being used to
produce. From GenAI slop all over social media to misinformation, GenAI is
highly corrosive to our already frayed social fabric. I think that
[Ed Zitron](https://www.wheresyoured.at/) in particular is doing a great job at
highlighting the problematic aspects of GenAI, so I won't elaborate further
here.

However, despite their flaws, LLMs _do_ increase the speed at which text (and
therefore code) can be generated. Even if all the current GenAI companies go
bankrupt, the technology is here to stay. The longest-lasting effect LLMs will
have on the economy is to make the value of text generation deflate rapidly.
Since writing code is text generation, an engineer's ability to write code will
depreciate in value.

> [!QUOTE] Despite their major flaws, LLMs are here to stay

I think that the affects of LLMs should be evaluated like any other innovation
that has changed the nature of an industry. From the combine to the calculator,
the common theme of technical innovation is that individuals are expected to
produce more value in the same amount of time.

### Case Study: Mining Engineering

Let's take a quick detour into another field: mining engineering. Technology
greatly changed the nature of the day-to-day work of engineers, especially in
entry-level roles.

My dad had a long career in mining engineering starting in the mid 80's. By the
time he retired, computing had greatly changed the nature of mining engineering
jobs. I asked him how expectations of junior engineers changed, and a few things
stood out:

- **Computers automated mine planning, modelling, etc.** --- this eliminated a
  whole category of tasks that junior engineers were previously utilized for.
- **Less people understand the basics, and rely more on the computer systems.**
  --- this placed significantly more value on an engineers ability to discern
  and understand the output from the computer system.
- **Junior engineers spend more time on the computer and less time in the
  field.** --- this means that junior engineers have less opportunity to learn
  the ropes doing in-the-trenches operations at mine sites.
- **Entry-level engineers are expected to quickly learn the tools to do the
  job.** --- those who couldn't learn and adapt quickly didn't make it.

Computing changed the nature of entry-level jobs in mining. The value that
junior engineers were expected to provide changed from rote computational work
to understanding and evaluating the output of the computer systems.

### LLMs Effects on Software Engineer Expectations

I think that LLMs are going to cause a step-change in the performance
expectations of roles across the economy, and software is no different. Junior
software engineers will no longer be able to differentiate themselves just by
being good at writing code. Instead, the expectations of entry-level engineers
will begin to include attributes that are currently only expected of more senior
engineers.

As the expectations of entry-level engineers increase, so too will the
requirements for more seasoned engineers. My prediction is that the standard
"career level" in the industry will look more like a staff engineer than a
senior engineer (at least for the technical competencies of the job).

What that means for junior engineers is that you will have to "grow up" and
develop faster than before. During the COVID hiring spree, junior engineers
didn't have to grow in order to get and keep their jobs. However, those who
didn't work on building their careers are now experiencing the repercussions as
they have been the first cuts made during the recent workforce reductions.

## Conclusion

I'm not going to sugar coat it: entering the software industry is harder now
than any time in the last decade. Nothing is guaranteed. Merely graduating high
school doesn't guarantee that you'll get into college. Merely getting into a
college doesn't guarantee you'll find a job. Merely getting a job doesn't
guarantee you'll be able to build a career in your desired field.

But you knew this already, because nothing in life is guaranteed. That's why
you've worked so hard to get to where you are. Continue to pursue your dreams.
Always look for opportunities for growth. Life is going to be hard anyway, you
might as well do something that you can be proud of. Don't just let your career
happen to you, take ownership of it and see where it takes you. Building a
career is hard, but the journey is more than worth it.
