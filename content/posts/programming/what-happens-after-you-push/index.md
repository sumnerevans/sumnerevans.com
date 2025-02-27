---
title: What Happens After You Push?
date: 2025-02-25T06:25:00-06:00
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
---

In this article we are going to be investigating how the code you write gets to
your users. This article is intended for consumption by computer science and
software engineering students to provide insights into technologies and
processes you might encounter in industry. This will be focused specifically on
software delivery in web-based SaaS offerings rather than more traditional
software delivery methods such as those seen in embedded systems. Every software
project has different process for building, testing, and deploying to users and
I'm not going to discuss every possible technology which might be used for each
of these steps. Rather, I'm going to be describing what _kinds_ of software
might be used. I'll describe how these systems affect the day-to-day work of
software engineers, and I'll also provide some thoughts on how you might
integrate some of these ideas into your own personal projects.

I'm a big believer in personal projects as a way to differentiate yourself from
other candidates. However, merely building another to-do app based on a React
tutorial is not going to set you apart from your competition. But if you make
the same to-do app, use CI to build a Docker container for it on every commit,
automatically deploy it with GitHub Actions to a Kubernetes in AWS ECS, set up
an alerting flow into PagerDuty for when it goes down, and have structured
logging queryable from Loki, then that becomes an interesting side project that
could differentiate you from other candidates. Another benefit of building a way
to deploy your code is that you can actually show it to recruiters! You don't
want this to be what the recruiter thinks when they look at your GitHub:

{{<figure
  src="images/code.webp"
  link="https://www.reddit.com/r/github/comments/1at9br4/i_am_new_to_github_and_i_have_lots_to_say"
  attr="Reddit r/github"
  attrlink="https://www.reddit.com/r/github/comments/1at9br4/i_am_new_to_github_and_i_have_lots_to_say">}}

I'm going to be focusing on three main facets of deploying code to production:
[Continuous Integration and Continuous Delivery (CI/CD)](#cicd),
[Containerization and Orchestration](#containerization-and-orchestration), and
[Monitoring and Logging](#monitoring-and-logging).

## Continuous Integration and Continuous Delivery (CI/CD) {#cicd}

According to the 2024 StackOverflow Survey, CI/CD is used by nearly 70% of all
developers.[^1]

[^1]: https://survey.stackoverflow.co/2024/professional-developers#developer-experience-professional-tech

{{<figure
  src="images/so-cicd.png"
  title="CI/CD is the most commonly available technology within professional software development organizations."
  attr="2024 StackOverflow Developer Survey"
  attrlink="https://survey.stackoverflow.co/2024/professional-developers#developer-experience-professional-tech">}}

### Continuous Delivery

Let's first discuss _Continuous Delivery_. To do so, we have to go back to the
dark ages before web apps were the norm. Before the web app boom in the 2000's,
most software was deployed to users via CD-ROMs and floppy disks. Users would
buy a physical copy of the software and install it on their computer. New
versions were only released every few years or sometimes even more infrequently
than that. There was nothing "continuous" about the delivery of software in
those days.

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
is made or shortly thereafter. The degree of continuousness varies greatly
between companies, teams, and projects.

#### Continuous Delivery Methods

There's about as many ways to do CD as there are projects using CD. There is a
sliding scale of deployment automation based on the needs of the project:

- **Degree to which manual intervention is required**: industries such as
  healthcare likely have more compliance requirements and will likely have more
  manual approvals required before deploying software updates. Industries such
  as the one I am in: chat, have fewer requirements and might require only
  minimal manual intervention.

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
  continuousness for different portions of the userbase (internal users, alpha
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
The most important thing you need to understand is that Git allows multiple
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

Containers gave rise to new software architectures such as microservices whereby
an application's code is split across multiple individual programs that can be
updated separately from one another.

#### Using Docker in Your Project

If your application is a web-based service, building a Docker container for it
is a great exercise. Building a Docker container for your application will force
you to enumerate the dependencies of your application and force you to describe
the steps required to build your application. It will also force you to
enumerate what external resources your program needs to access. Does it expose a
TCP port? Does it require filesystem access?

From there, you can create a `Dockerfile` which enumerates the dependencies of
your program and describes the steps required to build your software.

### Kubernetes

Often, you will end up with multiple containers communicating with one another.
For example, you might have multiple microservice containers which need to all
communicate with a shared a database container and a shared Redis or RabbitMQ
message bus. Maybe you even want to have multiple versions of each microservice.

Imagine you are deploying a new version of a login service which supports Google
Login. You're using A/B testing (like we discussed earlier) and you have to
deploy this new service to datacenters across the world. This process can be
highly error prone if done by hand!

That is where container orchestration software such as
[Kubernetes](https://kubernetes.io/) comes in. Other solutions to container
orchestration such as [Docker Swarm](https://docs.docker.com/engine/swarm/)
exist, but Kubernetes is still the most dominant player in the space. In fact,
many cloud providers provide hosted Kubernetes solutions such as
[Amazon ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
and [Azure AKS](https://learn.microsoft.com/en-us/azure/aks/what-is-aks).

There are about as many ways to use Kubernetes as there are projects using it.
Every project has its own unique way of utilizing Kubernetes. I'm not going to
go into much detail here, as (a) I'm not very well versed in Kubernetes and (b)
whatever I say will likely not be applicable at whatever company you end up at.

## Monitoring and Logging

So, now your software is containerized, and you have your CI/CD pipeline so that
it gets automatically built and deployed every time you push to `master`, you
need to know if it's working! That's where monitoring and logging come into
play.

As with the previous sections, monitoring and logging is highly
project-dependent, but I'm going to highlight some common themes.

### Monitoring

As we have seen from the previous sections, modern software is very complex. It
often involves multiple services talking to one another across and within
multiple datacenters. Every bit of complexity adds risk of failure and we need
to know if a failure occurs. We might deploy a bug, or the physical servers your
code is running on could die, or AWS could have a network outage, etc.

Additionally, we might need to collect statistics about application performance
across multiple versions of our software (remember A/B testing from earlier?).

Collecting all of these data points and metrics falls under the "monitoring"
umbrella. Some common techniques for monitoring include:

- **Healthchecks and Heartbeats**: these involve an external service checking on
  the status of our service. These checks are very course and detect major
  problems with the application.

  One basic check could be to just make sure that a service is available at all
  to external users. This might be as simple as "can I access the home page
  successfully"? I use [UptimeRobot](https://uptimerobot.com/) to monitor a few
  personal projects. It's way too expensive, but it's worth it for the peace of
  mind.

  Kubernetes has this functionality baked in. You can configure an endpoint and
  interval, and Kubernetes will try to access (ping) that endpoint on the
  container at the provided interval. If it returns a success code, then the
  service is assumed to be running properly. If it returns a failure code,
  Kubernetes can be configured to kill the container and restart it.

  A related monitoring technique is to invert the direction of the pings. The
  service itself sends a request at a regular interval to an external service.
  The external system ensures the pings keep coming at the appropriate interval,
  and as long as they do, the service is assumed to be operational.
  [Healthchecks.io](https://healthchecks.io/) is an example of a service which
  takes this approach.

- **Metrics**: often, the course-grained healthchecks or heartbeats are
  insufficient to determine if a service is operating smoothly. For example, the
  home page may be available, but are users able to log in?

  All non-trivial projects will generate some interesting data points (metrics)
  that can be monitored. Examples of metrics you might want to collect include:

  - HTTP status code per endpoint
  - Resource consumption (RAM, disk, CPU, etc.) per container/server
  - A distribution of how long it takes for your service to respond to a
    specific type of request
  - Conversion rate on a sign-up page
  - Percentage of users who add something to their cart per visit

  Every business and project will have different metrics which matter, and they
  might change over time. Collecting metrics is a critical component to creating
  data-driven businesses, which is all the rage right now.

  One example of a software for collecting metrics is
  [Prometheus](https://prometheus.io/docs/introduction/overview/).

So, we are collecting metrics, and doing healthchecks, but how do we let
developers know when things are broken? That is where _alerting_ comes in.
Alerting software monitors the metrics and healthchecks for abnormalities. For
example, you may configure the alert software to create an alert if RAM usage
goes above 90% or if error rate on login rises above 1%.

If the problem is not too severe, the alerting software might send an automated
message to a Slack channel. If it's more severe, it might send an alert to an
on-call developer's phone via something like
[PagerDuty](https://www.pagerduty.com/). Companies often require developers to
configure their PagerDuty to break through do-not-disturb on their phones.
Depending on the on-call policies, you may even be paged in the middle of the
night if the application experiences issues!

### Logging

So you've been woken up in the middle of the night due to some alert saying that
the login endpoint is experiencing an elevated level of
`500 Internal Server Error`s. How do you figure out what's going wrong? You
can't just restart your entire application in "debug mode" like you can with
school projects.

That is where _logging_ comes in. Logging refers to the program outputting a
_log_ indicating what it's doing. The log goes somewhere where it can be queried
by the developer. Systems such as [Loki](https://grafana.com/docs/loki/latest/)
and [Datadog](https://www.datadoghq.com/) are commonly used in industry to
collect and query logs.

Ideally, the logs are such that a developer could read them and find out what is
causing the problem. Debugging via logs is somewhat like print-line debugging:
you have to just read the logs and correlate it to the code that is being run to
identify where things went awry.

In order to make the logs more meaningful, many logging systems include a log
_level_ with every message. Common levels and their general meanings include:

- `error` - issues that have no mitigation, but are not fatal to the program
  continuing
- `warn` - minor issues that are unexpected but have mitigations
- `info` - information about what the program is doing
- `debug` - more granular information about what the program is doing

Every project will use the levels differently, but everyone agrees that you
should use `error` logs more sparingly than `debug` logs. I find
[this StackOverflow answer](https://stackoverflow.com/a/2031209/2319844) to be a
very good convention for when to use each log level.

You can probably imagine that a very busy application would generate _lots_ of
logs. Let's go back to our example: you are trying to debug the failing logins,
but there are _many_ logins happening at the same time, only some of which are
failing. You probably only want to look at the logs related to a failing
request.

This is where techniques such as _structured logging_ come in and add metadata
to your logs so that you can group logs together. Structured logs are often
JSON, and can include other data points in addition to the actual log message.
In the example above, you might add give each request a _request ID_ and add
that request ID to all logs related to that request. Most logging frameworks
have convenient tools for including such metadata to all logs generated through
an entire call stack. In our example, you could filter by request ID to see logs
related to a failing login.

I recommend that you get into a practice of debugging all your programs without
a debugger, relying on print-line debugging. This will tune your spidey-sense
for what pieces of information are useful to log, and what is not useful. I also
recommend that you set up structured logging early in your project, as it is
very unlikely that you will never want _less_ information to debug your program.

## Conclusion

This article is by no means comprehensive. The main goal of this article was to
provide some insights into things you might encounter in industry. I think that
the most important thing to take away from this is that (at any good engineering
firm) there are safeguards in place to detect issues and address them quickly.
If you find yourself at such an organization, you should feel empowered to
commit early and often in a branch. Use CI to your advantage to spot issues
before even merging. Allow the CD process to deploy with safeguards and allow
the monitoring stack to alert you when things go awry. And when things
inevitably break, rely on the logging in your application to debug the problem.
