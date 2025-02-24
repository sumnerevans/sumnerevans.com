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
image: images/matrix.jpg
build:
  publishResources: false
draft: true
---

In this article we are going to be investigating how the code you write gets to
your users. This will be focused specifically on SaaS offerings rather than more
traditional software delivery methods such as those seen in embedded systems.
Not every SaaS software has the same deployment process, and I'm not going to
talk about every possible technology which might be used for each of these
steps. Rather, I'm going to be describing what _kinds_ of software (with
examples) might be used. My focus will be on how that applies to software
engineers, and I'll also provide some thoughts on how you might integrate some
of these ideas into your own personal projects.

I'm going to be focusing on three main facets of deploying code to production:
[Continuous Integration and Continuous Delivery (CI/CD)](#cicd),
[Containerization and Orchestration](#containerization-and-orchestration), and
[Monitoring and Debugging](#monitoring-and-debugging).

## Continuous Integration and Continuous Delivery (CI/CD) {#cicd}

### Continuous Delivery

Let's first discuss **Continuous Delivery**. To do so, we have to go back to the
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

There's about as many ways to do CD as there are projects using CD.

Let's look at some of the tools used to implement Continuous Delivery

- ArgoCD
- GitLab CI/CD

Blue-green test

Additionally, it is common for teams to deploy to a small subset of users (maybe
company employees) before deploying to the public.

#### Adding Continuous Delivery to Your Project

- Have some _reproducible_ process for deploying your software updates to users
  (see later Dockerization)
- Often this just involves setting up a CI pipeline

### Continuous Integration

- lint
- build
- deploy

tools:

- GitHub Actions
- GitLab CI/CD

#### Adding Continuous Integration to Your Project

- have a CI lint and build step on every push
- maybe even require it to build before merging to master
- learn about all of the lint tools
  - pre-commit
  - black, gofmt/goimports, rustfmt, etc.

## Containerization and Orchestration

Remember how I mentioned that you want a reproducible way of deploying software
to users?

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
