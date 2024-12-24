---
title: "Sublime Music End-of-Maintenance"
date: 2024-12-24T03:00:00-06:00
categories: [Projects]
tags:
  - Sublime Music
image: images/logo.png
summary: |
  Today I'm announcing that Sublime Music has reached end-of-maintenance.
---

![](images/logo.png)

Today I'm announcing that Sublime Music has reached end-of-maintenance. This
announcement is greatly overdue, as I have not been actively maintaining the
project for over a year, and have not been actively developing new features for
even longer.

## Thank You!

I would like to start off by thanking everyone who used Sublime Music, reported
bugs, interacted in the Matrix room, and wrote code for the project. This
project is the most successful open source project I've started, and I am
grateful for the community that formed around it.

To all of the users of Sublime Music, thank you for trying out my project. I
hope that it was able to meet some of your needs for a Subsonic client.

To all of the people who reported bugs, thank you for caring enough about the
project to spend the time to report issues and feature requests. I know I was
not always super responsive, but know that I appreciate your effort and I'm
grateful that you gave Sublime Music a chance.

To all of the people who hopped into the Matrix room, thank you for spending
time interacting with me and the rest of the community. The community that
formed was amazing. It was supportive and collaborative and I appreciate
everyone who took time to join us.

To all of the people who contributed code to the project. Thank you for taking
the time to write bug fixes and new features for the project. As with the bug
reporters, I know I was not always super responsive. I want to apologise for
that and thank you for taking the time to help make the project better.

For me, the holiday season is a time for reflection and gratitude. I am grateful
for everyone who I've been able to interact with on this project.

## What Now?

I have archived the Sublime Music repository, and it will remain archived. The
name "Sublime Music" is copyrighted, and cannot be used by as the name of any
future forks or projects without express permission. If anyone wants to continue
the project, please feel free to fork and use a different name.

If you decide to fork, there is no need to make it an actual GitHub fork (forks
have annoying restrictions), but I would appreciate if you link back to my
original repository in the README.

If you are looking for a maintained project to use as your Linux Subsonic
client, I recommend you check out
[Supersonic](https://github.com/dweymouth/supersonic). It's a project built in
Go using the [Fyne](https://fyne.io/) library and if it was around when I
started Sublime Music, I probably would never have started my own project.

## Retrospective

The rest of this post is a public retrospective of the project. I'm mainly
writing this for myself, but if other people find it useful then that's a bonus.
The following bullets are in no particular order.

- **I massively overengineered the project.** On the bright side, that
  experience helped tune my sense of what abstractions are actually useful and
  which just look pretty on paper. However, the downside was that it made the
  project very unmaintainable and very difficult for new contributors to make
  meaningful changes.
- **This project allowed me to stretch many software engineering muscles.** I
  also tried many software engineering best-practices. This was the first
  project that I wrote an extensive test suite for and was also the first
  project that I wrote extensive docstrings for. I learned how to use Sphinx to
  publish the documentation from those docstrings.
- **I learned many useful technologies and libraries.** I learned multi-threaded
  Python, GTK3, and dbus and I think that my project was one of the first to use
  dataclasses extensively for JSON (de)serialization.
- **My project management skills were similarly put to the test during this
  project.** It was the largest programming endeavour I have ever embarked upon.
  I developed the project iteratively starting with the screens which I wanted
  to use the most, and slowly built out features to make a mostly complete
  Subsonic client.
- **I was also able to use my (small amounts) of design skill.** I think I build
  a UI which at least visually holds up pretty well (let's not talk about the
  performance issues). I used up the rest of my design skills to make the
  [website for Sublime Music](https://sublimemusic.app) which I'm pretty proud
  of as well.
- **I learned that ORMs are probably always waste of time.** Working on this
  project and contrasting it to working on other projects that I've worked on
  since then (namely the [mautrix](https://github.com/mautrix) bridges and other
  projects for Beeper) has convinced me that ORMs are a waste of time. I used
  the [peewee](http://docs.peewee-orm.com/en/latest/) ORM which is quite
  lightweight, but even that ended up being too abstract at times. Writing raw
  SQL is not hard, people should not be allergic to doing so.
- **I like types.** One of the best decisions that I made was enforcing type
  annotations across the codebase. If I were to restart the project, I would
  choose to do so in a typed language. Even with type annotations, it was quite
  difficult at times to figure out what types I needed where. At my job at
  Beeper, I write a lot of Go, and its type system is one of the biggest selling
  points for me.
- **Python dependency management is horrible.** I used a variety of different
  dependency management solutions over the years from Poetry to pip-tools. All
  of them suck. I've since been spoiled by the Go package management system with
  Go modules which is in my opinion the best package management solution out
  there right now.
- **Packaging on Linux is a disaster.** I was able to package Sublime Music for
  the AUR and NixOS. Other people contributed Alpine and Debian packages. The
  fundamental problem with Python packaging on Linux is that pretty much all
  libraries have to be bumped at the same time across all of the projects. This
  is a problem with dynamic linking in general, but I think it's exacerbated by
  the fact that Python is dynamic and you don't know until runtime if the
  library still has the same API. I also packaged for Flatpak for a little
  while, but that was quite difficult as well, and the tooling for Python was
  not great. Snap packages were even worse, and I never got one successfully
  working. Sure, all of this is probably a skill issue, but I'd say that in
  general, Linux packaging is not designed for dynamic linking in non-statically
  typed languages (it's also bad for statically typed languages, but slightly
  less bad). Again, I am now spoiled by Go, which is statically compiled to a
  single binary.
- **I think this project helped me get my current job.** When I spoke to
  [Eric](https://www.linkedin.com/in/ericmigi/) for the first time about working
  for Beeper, I pointed to Sublime Music as a project that I'd worked on in
  Python and I think that was part of the reason that he and Brad were willing
  to take the risk on hiring me. At the time, the only professional experience I
  had was in C#, ExtJS and React JS. I think that having this side project in a
  language that Beeper was using extensively (our bridges were mostly Python at
  the time) helped my chances.

Those are just a few thoughts about the project. I might update this in the
future with additional notes, but I think that this is a decent list of
learnings from this project.
