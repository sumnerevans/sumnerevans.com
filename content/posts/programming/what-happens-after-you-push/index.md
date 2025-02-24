---
title: What Happens After You Push?
date: 2025-02-20T06:25:00-06:00
categories:
  - Programming
tags:
  - CI/CD
  - Linting
  - Containers
  - Container Orchestration
  - Monitoring
  - Logging
description: |
  A survey of how code gets deployed and monitored, and how that impacts SWEs
image: images/so-cicd.png
build:
  publishResources: false
draft: true
---

In this article we are going to be investigating how the code you write gets to
your users. This will be focused specifically on SaaS offerings rather than more
traditional software delivery methods such as those seen in embedded systems.
Not every SaaS software has the same deployment process, and I'm not going to
discuss every possible technology which might be used for each of these steps.
Rather, I'm going to be describing what _kinds_ of software (with examples)
might be used. My focus will be on how that applies to software engineers, and
I'll also provide some thoughts on how you might integrate some of these ideas
into your own personal projects.

I'm a big believer in personal projects as a way to differentiate yourself from
other candidates. However, merely building another to-do app based on a React
tutorial is not going to set you apart from your competition. But if you make
the same to-do app, automatically build a Docker container on every push,
automatically deploy it to a Kubernetes cluster on AWS, set up an alerting flow
into PagerDuty for when it goes down, and have logs queryable from Loki, then
that becomes an interesting side project that could differentiate you from other
candidates.

I'm going to be focusing on three main facets of deploying code to production:
[Continuous Integration and Continuous Delivery (CI/CD)](#cicd),
[Containerization and Orchestration](#containerization-and-orchestration), and
[Monitoring and Debugging](#monitoring-and-debugging).

## Continuous Integration and Continuous Delivery (CI/CD) {#cicd}

According to the 2024 StackOverflow Survey, CI/CD is used by nearly 70% of all
developers.[^1] The likelihood that you will encounter CI/CD in your job is very
high.

[^1]: https://survey.stackoverflow.co/2024/professional-developers#developer-experience-professional-tech

{{<figure
  src="images/so-cicd.png"
  title="Some form of CI/CD is the most commonly available technology within professional software development organizations."
  attr="2024 StackOverflow Developer Survey"
  attrlink="https://survey.stackoverflow.co/2024/professional-developers#developer-experience-professional-tech">}}

### Continuous Delivery

Let's first discuss _Continuous Delivery_. To do so, we have to go back to the
dark ages before web apps were the norm. Before the web app boom in the 2000's,
most software was deployed to user via CD-ROMs and floppy disks. Users would buy
a physical copy of the software, and install it on their computer. New versions
were only released every year or sometimes even more infrequently than that.
There was nothing "continuous" about the delivery of software in those days.

As web apps became more prevalent, users were no longer installing software on
their computers, they just visited the web app. On the deployment side, shipping
a new version of software to users became trivial. Instead of having to create a
new disk and do a marketing campaign about a new version, all you have to do is
update the server! As soon as the user refreshes their page, they'd have the
latest version of your application!

This ability to deploy software rapidly began to change the way that software
was built and sold. Companies no longer had to include lots of new features in
every new version of the software so that the marketers could convince people to
buy the new version. Instead, companies could make small iterations on the
software, and charge a monthly fee for access to the web app. This SaaS model
has become the dominant model for deploying applications to users, and has given
rise to lots of changes in the software industry. In particular, the Agile
software development pattern of rapid, small iterations is made possible by
deploying to users quickly and regularly.

The term _continuous delivery_ describes a software engineering philosophy where
new versions of the software are deployed regularly, often as soon as a change
is made or shortly thereafter. The degree of continuous-ness varies greatly
between companies, teams, and projects.

#### Continuous Delivery Methods

There's about as many ways to do CD as there are projects using CD. There is a
sliding scale of deployment automation based on the needs of the project:

- **Degree to which manual intervention is required**: industries such as
  healthcare will likely have more requirements for verifying before deploying
  software updates than industries such as chat.

- **Scope of deployment**: it is common for teams to only deploy immediately to
  a small subset of users (often just company employees or even a subset
  thereof). After testing, the code is deployed more widely. This strategy is
  often called _canary deployment_.

  An example of a commonly-used practice is _A/B testing_. A segment of the
  userbase (often 1% or 10%) will be served using the new version while the rest
  of the userbase is still on the old version. Then, specific metrics such as
  number of crashes per user, user engagement, or click-through rate are
  monitored. If there is a regression in some metric for the users on the new
  version, then the change can be reverted.

  Another strategy you might encounter is _green-blue deployment_. You have two
  environments (the green one and the blue one). At any given time, one
  environment is your production environment, and the other is a staging
  environment. The staging environment is updated and verifications are run, and
  then the environments are swapped. This (ideally) allows fast reversions back
  to the old version if something goes wrong. Things get complicated when you
  have data migrations, but that's a topic for another article.

- **Deploy cadence**: some companies deploy immediately when there is a push to
  `master`/`main`, while others have a weekly, monthly, quarterly, or even
  bi-annual or annual cadence. At which point you decide it's no longer
  "continuous" is pretty subjective, especially if there is a different level of
  continuous-ness for different portions of the userbase (internal users, alpha
  testers, beta testers, general release).

#### Continuous Delivery Tools

Continuous Delivery has to be very customized to your project's infrastructure,
so tooling varies greatly between companies. In many cases, the tooling is
custom-built by the company. At Beeper, we currently have a combination of
[Argo CD](https://argoproj.github.io/cd/) for managing our Kubernetes clusters
and a bunch of custom software for deploying various parts of our
infrastructure.

Simpler projects might use things like
[GitHub Actions](https://github.com/features/actions) or
[GitLab CI/CD](https://about.gitlab.com/topics/ci-cd/) to automate deployment of
their application.

#### Adding Continuous Delivery to Your Project

So, how do you add Continuous Delivery to your side project? The first thing you
need is a _reproducible and deterministic_ process for deploying your software.
I'll talk about some technologies that make this easier later, but the most
important thing is that your deployment process must not be haphazard. At the
start, it might just be a series of steps written down in a README.

The next step is to start automating things. Begin writing shell scripts for
individual tasks and start chaining them together.

Then, using whatever CI/CD software your Git host provides (almost all of them
have some CI/CD solution), create a pipeline that invokes those scripts.

If you are struggling to think of a project you can start continuously
delivering, maybe start with a personal website, or implement CD on a simple
tutorial project. The most important thing is to _be lazy_. If it's repetitive,
make the computer do it!

This website is an example of how you can use CD on a personal project. There is
a
[GitHub Action](https://github.com/sumnerevans/sumnerevans.com/blob/master/.github/workflows/build.yaml)
which builds the website using [Hugo](https://gohugo.io/) and deploys it to
[GitHub Pages](https://pages.github.com/). It's not anything fancy, but just
getting familiar with the concepts and tools is valuable.

At work, every push to the `main` branch of a
[mautrix bridge repositories](https://github.com/mautrix) invokes a build and
deploys the change to all Beeper employees. We have some custom tools that
perform the actual deployment, but the process is controlled by a
[GitLab CI/CD pipeline definition](https://mau.dev/mautrix/ci).

### Continuous Integration

You might be thinking: this seems scary! Deploying changes immediately to users?
Won't you have bugs? That is where _Continuous Integration_ comes in.

As its name implies, Continuous Integration is a software engineering practice
where code written by developers is _integrated_ rapidly. Integration is the
process by which code written by an individual developer is brought into the
broader project codebase. Developers are encouraged to merge their code
iteratively rather than in large batches.

Now, you might still be thinking: this feels even more chaotic! How do I know if
the iterative changes are actually correct? That's where two important concepts
come in: source control and automation.

#### Source Control

The first way to reduce the chaos is to use a source control system such as
[Git](https://git-scm.com/). I've discussed Git in
[a past presentation for ACM]({{<ref"../../../portfolio/index.html#presentation-acm-git-good">}}).
The most important thing you need to understand is that Git allow multiple
people to work on the same codebase asynchronously. It provides tools for
keeping changes separate until you _merge_ (integrate) them into the wider
codebase.

Git allows individual developers to iterate quickly on a branch and verify their
changes before integrating more widely into the codebase.

#### Automation

When you push code to a repository, that will trigger a set of automated checks
to verify your changes. This might include:

- **Building the Code**: one of the most common checks is to actually just build
  the executable. If the code compiles, then it is infinitely more likely to be
  correct than if it doesn't compile.

- **Linting**: a _linter_ is a piece of software which checks your code for
  mistakes. The definition of _mistake_ is pretty broad and can include things
  such as:

  - not meeting the code formatting standards of the organization
  - using deprecated/vulnerable function calls or libraries
  - finding certain bad-practices such as misuse of a mathematical `rand` in a
    cryptography context

  One of the main benefits of automated linting is that code reviewers don't
  have to spend time critiquing code style since that process is automated.

- **Tests**: if your codebase has tests (it almost always should have _some_),
  they are very likely to be run as an automated check. Ideally, your tests
  should be written to catch _regressions_ caused by an unintended consequence
  of future code changes.

  Some people split up their tests into unit, integration, and end-to-end tests.
  In my opinion, these distinctions are somewhat academic and often very blurry.
  Often times, all of these types of tests use the same underlying test
  framework. However, in general:

  - unit tests are for small pieces of code, often only a specific function,
    class, struct, or module
  - integration tests are for testing the interaction between modules within a
    codebase
  - end-to-end tests spin up an entire test environment including things like
    databases and run tests observing the external behaviour of the system

  To me, the distinction between these different types of tests is less
  important than (a) having the tests at all and (b) running them on every push.

#### Continuous Integration Tools

Many of the tools that I mentioned in the
[Continuous Delivery](#continuous-delivery) section also provide CI
capabilities. Some of the most common overarching tools include:

- [GitHub Actions](https://github.com/features/actions): great if you are
  already using GitHub.
- [GitLab CI/CD](https://about.gitlab.com/topics/ci-cd/): great if you are
  already using GitLab.
- [Jenkins](https://www.jenkins.io/doc/tutorials/): one of the oldest and most
  widely used CI/CD solutions.
- [Bamboo](https://www.atlassian.com/software/bamboo): great if you are already
  using Atlassian products (BitBucket, Jira, Confluence).

Every project will have its own set of specific automated checks, many of which
might be custom checks. I'm going to list a few that I've worked with and
explain what they provide, but the number of possible tools is very diverse and
every company and project will probably have its own set of automated processes.

- [pre-commit](https://pre-commit.com/) for configuring a set of automated
  checks to run.
  [Example run](https://github.com/mautrix/telegramgo/actions/runs/13461485321/job/37617658811)
  and
  [config](https://github.com/mautrix/telegramgo/blob/f0f92c9dd98a739a3f70821d0ca2a3a79b17fe17/.pre-commit-config.yaml).
- [black](https://black.readthedocs.io/en/stable/) formatter for Python. I like
  this one because it's very opinionated and highly deterministic.
- [gofmt](https://pkg.go.dev/cmd/gofmt) and
  [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports) formatters
  for Go. These are also highly opinionated and result in all Go code being
  formatted the same way.
- Go [vet](https://pkg.go.dev/cmd/vet) for finding common mistakes in Go code.
- [rustfmt](https://rust-lang.github.io/rustfmt/) formatter for Rust.

#### What CI Means for Software Engineers

How does CI affect the day-to-day of a software engineer? I think that there are
three main implications:

1. **Do all (or almost all) of your work on a branch.** This will allow you to
   iterate quickly without affecting other developers on the project. I very
   often use branches on projects where I'm the only contributor so that I get
   the benefits of automated checks before I merge.
2. **Commit early and often, and push liberally.** Every commit is a savefile
   for your code, and pushing ensures that if your computer goes kaput, you'll
   not lose all your work.
3. **Don't rely on CI to do all the testing, linting and building for you.** You
   should install and be able to run all the tools that the automated processes
   invoke. That way, you can have fast iteration cycles and reproduce issues
   locally. This is especially true when it comes to linting, you should install
   whatever linter the project uses so that you can keep your code formatted to
   the specification of the project.

Very often, projects will require the automated processes to succeed on a branch
before that branch can be merged to `master`/`main`. This helps ensure that the
code on `master`/`main` is always "good".

#### Adding Continuous Integration to Your Project

The first steps to adding CI to your project are to pick the automatic checks
you want to perform on the code. Choose a linter to enforce your preferred code
style, write tests to verify your code's behaviour, and determine the set of
steps required to build your code.

Then, just like the process with CD, start automating things with scripts if
necessary and pick a CI software to run those automations on every push.

Then you can play around with adding restrictions to certain branches, say not
allowing merges to `main` until all tests and lints pass.

In my opinion, it's a lot easier to add CI to a personal project, since almost
every software project has a build process that can be performed every commit.
All projects should have a specific code style that can be enforced by a linter.
Most projects should also have some tests that can be performed as well.

I have multiple projects with automated build and lint processes. For example
[webfortune](https://github.com/sumnerevans/webfortune/blob/master/.github/workflows/deploy.yaml)
and even my
[Advent of Code repo](https://github.com/sumnerevans/advent-of-code/blob/master/.github/workflows/go.yaml).

Open source projects I contribute to such as
[Nix home-manager](https://github.com/nix-community/home-manager) run tests on
every PR.

At work, every push to the `main` branch of a
[mautrix bridge repositories](https://github.com/mautrix) invokes a build and
runs pre-commit lint checks which include static analysis and formatting checks.

## Containerization and Orchestration

Remember how I mentioned that you want a reproducible way of deploying software
to users? Well, we are now going to switch gears and discuss two of the most
prevalent technologies for delivering web-based software to users: Docker and
Kubernetes.

According to the StackOverflow survey, Docker is used by 53% of developers and
Kubernetes is used by 20% of developers.[^2]

[^2]: https://survey.stackoverflow.co/2024/technology#most-popular-technologies-tools-tech

{{<figure
  src="images/so-docker.png"
  width="600"
  title="Docker and Kubernetes are among the most popular technologies used by professional developers"
  attr="2024 StackOverflow Developer Survey"
  attrlink="https://survey.stackoverflow.co/2024/technology#most-popular-technologies-tools-tech">}}

### Docker

In order to understand Docker, we need to understand the problem that it solved.

Pretty much all code has _some_ dependencies. Maybe it relies on a specific
Linux OS, specific system libraries, and specific external programs. Now imagine
that it also relies on having specific versions of each of these things.

That's a lot of things to manage! Now imagine that you have to deploy your
program to servers across multiple datacenters located all around the world so
that your users have a fast, low-latency experience. You would have to ensure
that every single server was configured exactly the same way with the exact same
versions of everything.

And what if you had to upgrade a version of one of your dependencies? You'd have
to upgrade the version across all your servers. And what if something went wrong
during this process you'd be in a world of hurt.

This is where Docker comes in. Docker allows you to bundle all of your software
dependencies in a single _container_. You can specify the Linux OS, system
libraries, and external programs required to make your program run. With Docker,
the underlying operating system does not need to be updated when you update your
software since the Docker container is self-contained.

Docker containers also benefit from running in isolated environments. They
cannot interfere with one another, and many can be run on the same system. The
dependencies of one Docker container do not affect the dependencies of another,
and (unless configured to do so) they cannot access resources of another
container.

### Using Containerization in Your Project

- build a Docker container that can run the web server for your project
- this will force you to think about the dependencies of your project

## Monitoring and Debugging

So, now your software is containerized, and you have your CI/CD pipeline so that
it gets automatically built and deployed every time you push to `master`, you
need to know if it's working! That's where monitoring and debugging come into
play.

monitoring

- uptime pings
- healthchecks (k8s)
- PagerDuty for when things explode

debugging

- logging, logging, logging
  - log levels
