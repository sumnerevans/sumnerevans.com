---
title: "Portfolio"
---

This page is my extended Curriculum Vitae containing all of my professional
achievements. For a more concise overview, please view my resume_.

.. contents:: **Table of Contents**
   :backlinks: none

.. _resume: ./resume.pdf

Experience
==========

|ttd|_ -- Software Engineer -- June 2019 - Present
    *Key Technologies:* ReactJS, C#, SQL

    I am a member of the Connected TV engineering team. I am responsible for
    building features related to Connected TV across the entire stack from the
    high performance bidding systems to the client UI for advertisers.

    Notable projects include:

    * Implementing ingestion of the ``ifa_type`` field in OpenRTB requests.
    * Implementing many of the frontend features for Connected TV planning.

|csm|_ -- Instructor (Advanced Computer Architecture) -- Starting January 2021
    I will be teaching *CSCI 564 Advanced Computer Architecture* this coming
    Spring 2021 semester.

|csm|_ -- Instructor (Programming Languages) -- August 2020 - December 2020
    I taught a section of *CSCI 400 Principles of Programming Languages* in
    Fall of 2020. Topics that the class covered include: functional programming
    concepts, type inference, OCaml, programming language implementation, and
    formal semantics.

|csm|_ -- Instructor (Programming Languages) -- January 2019 - May 2019
    I taught *CSCI 400 Principles of Programming Languages* in Spring of 2019.
    Topics that the class covered include: programming language concepts,
    evaluation, and implementation; OOP; Lambda Calculus; and Racket (a LISP
    dialect).

|csm|_ -- Instructor (Algorithms) -- August 2018 - December 2018
    I taught a section of *CSCI 406 Algorithms* in Fall of 2018. Topics that the
    class covered include: analysis of algorithms, evaluation of data
    structures, sorting algorithms, dynamic programming, graph algorithms, and
    NP-completeness.

|pivotal|_ -- Software Engineering Intern -- May 2018 - August 2018
    I worked on the *Infra* pod on the Tracker team, the team responsible for
    developing *Pivotal Tracker*. I anchored the development of a new system for
    imaging workstations for consistent workflows on all machines used by the
    Tracker team. I also participated in a LEAN Product process to determine the
    needs of the Tracker team.

|unplugged|_ -- CS@Mines on Tour Presenter -- January 2017 - May 2018
    I gave presentations to high school students about the Computer Science
    Department at Mines. I also led computer science related workshops for
    middle school students.

|csm|_ -- Teachers Assistant (Data Structures) -- August 2017 - May 2018
    I assisted students during TA office hours and during the in-class lab
    sessions. I was nominated for the Student Employee of the Year by CPW, the
    faculty member responsible for the course.

|kenzan|_ -- Software Development Intern -- June 2017 - August 2017
    I contributed to OSS projects including React and Node.js on behalf of
    Kenzan. I also worked to improve the Kenzan.com website by implementing a
    CI/CD Jenkins pipeline with a WebPack build.

|canam|_ -- Software Developer -- February 2013 - August 2016
    *Key Technologies:* C#, ExtJS, SQL

    I worked on the Teller Development Team designing and building new features
    for Teller, an enterprise point-of-sale system geared towards municipal
    governments.

    I primarily worked on the web-based application which uses a technology
    stack consisting of Ext JS (a JavaScript framework), C#.NET, and Oracle
    PL/SQL, but I also worked on the native Windows application. Additionally, I
    designed and built plugins that integrate external systems into Teller. One
    of the more notable plugins I developed was an integration with Bank of
    America for electronic deposit of checks.

Education
=========

|csm|_ -- M.S. Computer Science, 4.0 GPA -- August 2018 - May 2019
    I worked with Dr. Dinesh Mehta on a project to automate group selection for
    projects in CSCI 406 Algorithms.

    I served as the Chair of the Mines ACM Student Chapter, the Linux Help
    Guru of the Linux Users Group, and the Service Chair of the Mines chapter
    of the Tau Beta Pi Honor Society.

    Notable classes I took include:

    * Advanced High Performance Computing
    * Parallel Computing
    * Advanced Computer Architecture
    * Abstract Algebra
    * Theory of Computation
    * Theory of Cryptography
    * Human-Centered Robotics
    * Bioinformatics

|csm|_ -- B.S. Computer Science, 3.9 GPA -- August 2018 - May 2019
    I graduated with a degree in Computer Science from Colorado School of Mines.
    I was awarded the *Outstanding Graduating Senior* award for Computer
    Science.

    As a student I served one year as the Vice President of the Mines ACM
    Student Chapter and one and a half years as Secretary of the Mines Linux
    Users Group (LUG). I made Dean's List every semester of my undergraduate
    studies.

    Notable classes I took include:

    * Operating Systems
    * Algorithms
    * Computer Graphics
    * Computer Simulation
    * Virtual Reality
    * Principles of Programming Languages
    * Artificial Intelligence
    * Software Engineering & Advanced Software Engineering (Field Session)
    * Computer Organization
    * Linear Algebra
    * Data Structures

|rrcc|_ -- Mines Transfer Program, 4.0 GPA -- August 2012 - May 2016
    Through high school, I took classes at Red Rocks Community College via the
    transfer program between Colorado School of Mines and Red Rocks. I was a
    member of the Phi Theta Kappa Honor Society for three years.

    I was selected to be `published in CLARO <claro_>`_ an interdisciplinary
    scholarly journal. I then `presented my work <claropresentation_>`_ at the
    CLARO academic conference.

    Notable classes that I took while at Red Rocks include:

    * Spanish Language I and II
    * Calculus I, II, III, and Differential Equations
    * Chemistry I and II
    * Calculus-Based Physics I and II

    .. _claropresentation: https://youtu.be/yRGqNewEeoQ

.. |ttd| replace:: **The Trade Desk**
.. _ttd: https://thetradedesk.com
.. |csm| replace:: **Colorado School of Mines**
.. _csm: https://mines.edu
.. |unplugged| replace:: **CS Unplugged**
.. _unplugged: http://csunplugged.mines.edu/
.. |pivotal| replace:: **Pivotal**
.. _pivotal: https://pivotal.io
.. |kenzan| replace:: **Kenzan**
.. _kenzan: https://kenzan.com
.. |canam| replace:: **Can/Am Technologies**
.. _canam: https://canamtechnologies.com
.. |rrcc| replace:: **Red Rocks Community College**
.. _rrcc: https://rrcc.edu

Projects
========

|sublime-music|_ -- November 2018 - Present
  Sublime Music is a native, GTK3 Subsonic_, Airsonic_, Revel_, Gonic_,
  Navidrome_ client for the Linux Desktop that is written in Python. Sublime
  Music allows users to connect to multiple Subsonic API-compliant servers, and
  browse and play music from those servers.

  Other features include being able to play music through Chromecast devices on
  the same LAN; *Offline Mode* and the ability to cache songs for offline
  listening; a DBus MPRIS interface integration for controlling Sublime Music
  via ``playerctl``, ``i3status-rust``, KDE Connect, and other DBus MPRIS
  clients; a sophisticated play queue; playlist management; and more.

  Sublime Music is developed on `GitLab <sublime_gitlab_>`_ and is available via
  the `AUR <sublime_aur_>`_, `NixOS 20.09 <sublime_nix_>`_ and later, `Debian
  Testing <sublime_deb_>`_, as a `Flatpak <sublime_flatpak_>`_, and via `PyPi
  <sublime_pypi_>`_.

  .. |sublime-music| replace:: **Sublime Music**
  .. _sublime-music: https://sublimemusic.app
  .. _sublime_gitlab: https://gitlab.com/sublime-music/sublime-music
  .. _Subsonic: http://www.subsonic.org/pages/index.jsp
  .. _Airsonic: https://airsonic.github.io/
  .. _Revel: https://gitlab.com/robozman/revel
  .. _Gonic: https://github.com/sentriz/gonic
  .. _Navidrome: https://www.navidrome.org/
  .. _sublime_aur: https://aur.archlinux.org/packages/sublime-music/
  .. _sublime_nix: https://search.nixos.org/packages?show=sublime-music&query=sublime-music&channel=20.09
  .. _sublime_nix_unstable: https://search.nixos.org/packages?show=sublime-music&query=sublime-music&channel=unstable
  .. _sublime_deb: https://packages.debian.org/bullseye/sublime-music
  .. _sublime_flatpak: https://gitlab.com/sumner/sublime-music/-/releases
  .. _sublime_pypi: https://pypi.org/project/sublime-music/

|tracktime|_ -- June 2018 - Present
  Tracktime is a filesystem-backed time tracking solution with a command line
  interface. It uses a sane directory structure to organize CSV files that store
  time tracking data for each day.

  Tracktime allows you to start, stop, resume, and list time entries for a given
  day. You can also generate reports for a given month in the reStructuredText,
  PDF, or HTML formats (optionally restricted to a particular customer).
  Tracktime also allows you to synchronise the time spent on each issue/merge
  request to GitLab using the GitLab Time Tracking API.

  Tracktime is written in Python, and is available via `PyPi <tt_pypi_>`_ and on
  the `AUR <tt_aur_>`_.

  .. |tracktime| replace:: **Tracktime**
  .. _tracktime: https://sr.ht/~sumner/tracktime
  .. _tt_pypi: https://pypi.org/project/tracktime/
  .. _tt_aur: https://aur.archlinux.org/packages/tracktime/

|offlinemsmtp|_ -- June 2018 - Present
  Read my blog post announcing ``offlinemsmtp`` v0.3.5: `Introducing
  offlinemsmtp`_.

  ``offlinemsmtp`` allows you to use the ``msmtp`` SMTP email sending program
  offline. While offline, it enqueues emails to be sent once an internet
  connection is established. While online, it sends the emails immediately.

  ``offlinemsmtp`` is written in Python, and is available via `PyPi <offlinemsmtp_pypi_>`_ and on
  the `AUR <offlinemsmtp_aur_>`_.

  .. |offlinemsmtp| replace:: **offlinemsmtp**
  .. _offlinemsmtp: https://sr.ht/~sumner/offlinemsmtp
  .. _offlinemsmtp_pypi: https://pypi.org/project/offlinemsmtp/
  .. _offlinemsmtp_aur: https://aur.archlinux.org/packages/offlinemsmtp/
  .. _Introducing offlinemsmtp: {{< ref "/posts/projects/introducing-offlinemsmtp" >}}

|visplay|_ -- February 2018 - May 2020
  Visplay is a Mines ACM project. It's goal is to create a digital signage
  system with a dynamic, hierarchical configuration system which can be used in
  a wide variety of hardware and infrastructure configurations.

  I worked on the initial design of the overall architecture of the project. I
  have also contributed in a project management role. I worked on the Python
  components of the project which consume the configuration files and generate
  playlists. I also led development of the web configuration frontend.

  Currently, I am working in an advisory role as an industry project mentor.

  .. |visplay| replace:: **Visplay**
  .. _visplay: https://gitlab.com/ColoradoSchoolOfMines/visplay

|mlocate|_ -- February 2019
  This project won *Second Place* at `HackCU V <hackcu_>`_.

  Read my blog post about this hackathon:
  `HackCU V <{{< ref "/posts/hackathons/hackcu-v" >}}>`_

  MLocate is a comprehensive system for tracking and locating devices within an
  indoor space just using Wi-Fi ping signals. Using three specially configured
  Wi-Fi access points, we were able to capture signal strength from every device
  in the room by MAC address. Then, applying Radio Signal Strength Indication
  (RSSI) models, we were able to derive distance from signal strength which
  allowed us to use standard triangulation algorithms for determining the
  location of all of every device in the room.

  I worked on the triangulation logic for pinpointing device locations given
  distances calculated from signal strength. I also built the web frontend for
  displaying device locations.

  MLocate was a hackathon project by `Ben Perkins`_, `Jesus Nuñez`_, `Nick
  Jarmusz`_, (all freshmen) and myself. We developed it during a 24 hour period
  at the `HackCU V <hackcu_>`_ hackathon.

  .. |mlocate| replace:: **MLocate**
  .. _mlocate: https://gitlab.com/ColoradoSchoolOfMines/mlocate

.. _project-hypar-map:

|hyparmap|_ -- November 2018
  This project won *First Place* at the Facebook Global Hackathon Finals at
  Facebook HQ.

  Read my blog post about this hackathon: `Facebook Global Hackathon Finals -
  The Competition <fbblog_>`_.

  HypAR Map helps users navigate around unfamiliar locations by overlaying a map
  of the area using augmented reality. The map can come from any photo (for
  example, a fire escape plan) and is calibrated using an intuitive user
  interface. HypAR Map then uses simultaneous location and mapping to find and
  display the location of the user in the map in real-time.

  I worked on the image import functionality and worked with all of the members
  of the team to ensure that everything connected properly.

  HypAR Map was a hackathon project by `Sam Sartor`_, `Jack Garner`_, `Fisher
  Darling`_, and myself. We developed it during a 24 hour period at the Facebook
  Global Hackathon Finals at Facebook HQ in Menlo Park, CA.

  Watch our `demo on YouTube <https://www.youtube.com/watch/qYet1ka1J3I>`_.

  .. |hyparmap| replace:: **HypAR Map**
  .. _hyparmap: https://gitlab.com/ColoradoSchoolOfMines/facebook-hackathon
  .. _fbblog: {{< ref "/posts/hackathons/2018-11-16-facebook-hackathon-the-competition" >}}

.. _project-datanium:

|datanium|_ -- October 2018
  This project won *Best Use of GCP* and the *Facebook Best Social Good Hack*
  awards at MHacks_.

  Datanium is a large-scale network of Raspberry Pis which allow for
  human-powered transfer of data between places with internet access and places
  which do not. In the Datanium ecosystem, there are two different types of
  users: consumers and couriers. Consumers request data, and Datanium ensures
  that couriers move the requested data to the Datanium Node closest to the
  consuming user. Datanium does this coordination using only SMS.

  I worked on the web frontend for requesting and uploading data to the Datanium
  nodes.

  Datanium was a hackathon project by `Sam Sartor`_, `Robby Zampino`_, `Fisher
  Darling`_, and myself. We developed it during a 36 hour period at the `MHacks
  2018 <mhacks_>`_ hackathon.

  .. |datanium| replace:: **Datanium**
  .. _datanium: https://gitlab.com/ColoradoSchoolOfMines/datanium

.. _project-wii-track:

|wiitrack|_ -- February 2018
  This project won *Judges Favorite*, *Best Use of AWS*, and the *Dish Network*
  sponsor challenge at `HackCU IV <hackcu_>`_.

  Wii-Track is a distributed inventory tracking system. It utilizes a WiiFit,
  Rasberry Pi, and Arduino to gather information about packages. All heavy
  computation is done on AWS Lambda and it uses the DynamoDB NoSQL database as a
  backend.

  I worked on setting up the DynamoDB database and implemented a AWS Lambda
  function to identify packages by weight.

  Wii-Track was a hackathon project by `David Florness`_, `Jack Garner`_, `Robby
  Zampino`_, and myself. We developed it during a 24 hour period at the `HackCU
  IV <hackcu_>`_ hackathon.

  .. |wiitrack| replace:: **Wii-Track**
  .. _wiitrack: https://github.com/ColoradoSchoolOfMines/wii-track

.. _project-blockmrs:

|blockmrs|_ -- January 2018
  BlockMRS is a privacy concious, decentralized, blockchain-backed, medical
  record system for the 21st Century. It stores patient records in IPFS using
  asymmetric encryption giving patients control over their health data.

  I led the development of the protocol specification for this decentralized
  system. I also built the system for storing encrypted medical records in IPFS.

  BlockMRS was a hackathon project by `David Florness`_, `Jack Rosenthal`_,
  `Robby Zampino`_, and myself. We developed it during a 24 hour period at the
  `MinneHack 2018 <minnehack_>`_ hackathon.

  .. |blockmrs| replace:: **BlockMRS**
  .. _blockmrs: https://github.com/ColoradoSchoolOfMines/blockmrs

|vrfp|_ -- August 2017 - December 2017
  Read our `final report on GitHub <vr-report_>`_.

  This was the final project from my independent study in Virtual Reality under
  the supervision of Dr. Paone. Our team consisted of `Sam Sartor`_, `Robbie
  Merillat`_, and myself.

  We created our own library called ``flight`` for developing VR applications
  which implemented a new type of program architecture called Deferred Immediate
  Mode.

  .. |vrfp| replace:: **Virtual Reality Final Project**
  .. _vrfp: https://github.com/CSM-Dream-Team/final-project
  .. _vr-report: https://github.com/CSM-Dream-Team/final-project/blob/master/doc/report/final-report.pdf

.. _project-parqyng-lots:

|parqyng|_ -- October 2017
  This project won the *Grand Prize* at the 2017 Xilinx PYNQ Hackathon.

  Parqyng Lots tracks the number of cars in an arbitrary number of parking lots
  with an arbitrary number of entrances to create an up-to-date picture of the
  parking situation.

  I built the web frontend which provided a view of the parking lots' status.

  Our team consisted of `Sam Sartor`_, `Jack Rosenthal`_, `Daichi Jameson`_, and
  myself. I worked on the web interface and also helped implement the tracking
  system using the sensors provided by Xilinx.

  Watch our `video on YouTube <https://www.youtube.com/watch/qi9YZLhS0gk>`_.

  .. |parqyng| replace:: **Parqyng Lots**
  .. _parqyng: https://github.com/ColoradoSchoolOfMines/parqyng-lots

.. _project-wireless-debugging:

|widb|_ -- May 2017 - June 2017
  Wireless Debugging is a mobile SDK and sample web server for streaming mobile
  app logs to a web UI console. I worked on this project on a team of five CS
  students during Mines Computer Science Field Session. This project was done
  under supervision of Google.

  We designed and built a mobile API, log parsing library, datastore interface,
  user management interface, and web app. I was the primary writer of the API
  Specification for communicating between each component. I also built the log
  parsing library and the mobile API implementation for iOS. I was involved in
  the development of the other components as well.

  .. |widb| replace:: **Wireless Debugging**
  .. _widb: https://github.com/sumnerevans/wireless-debugging

|chesspp|_ -- August 2016
  Chess++ was my final project for CSCI 261 at Colorado School of Mines during
  the Summer II Semester of 2016.

  Chess++ allows two players to play a standard Chess game against one another
  on the computer.

  .. |chesspp| replace:: **Chess++**
  .. _chesspp: https://github.com/sumnerevans/chessplusplus

|snowflakes|_ -- November 2016
  See a `live demo <https://sumnerevans.github.io/snowflakes/>`_.

  Snowflakes is an interactive "screensaver" built for the Mines ACM JavaScript
  Hackathon.

  I built Snowflakes with **bungle.js**, a team consisting of `Sam Sartor`_,
  `Jack Rosenthal`_, and myself. We used EaselJS to manipulate a fullscreen
  canvas to render the interactive elements.

  .. |snowflakes| replace:: **Snowflakes**
  .. _snowflakes: https://github.com/sumnerevans/snowflakes

|qs|_ -- September 2016
  See a `live demo <https://qs.sumnerevans.com/>`__.

  Quadratic Solver solves quadratic equations and shows the steps required to
  get the answer.

  Quadratic Solver uses `MathJax <https://www.mathjax.org/>`_ to display
  beautifully formatted solutions to quadratic equations.

  .. |qs| replace:: **Quadratic Solver**
  .. _qs: https://github.com/sumnerevans/quadratic-solver

.. _hackcu: https://hackcu.org
.. _mhacks: https://mhacks.org
.. _minnehack: https://minnehack.io

Publications
============

.. _publication-dreams-of-flight:

|claro|_ -- Fall 2013
  I wrote this creative writing piece about Orville and Wilbur Wright and the
  first flight at Kitty Hawk for my Twentieth Century World History class in
  Fall 2013. I had written this piece for an assignment called *A Picture is
  Worth a Thousand Words*. We were tasked with writing an approximately 1000
  word narrative from the perspective of a person in a significant photo from
  the 20th Century. Later in 2013 I was published in the |claro2013|_, Red Rocks
  Community College's Interdisciplinary Scholarly Journal. In May 2014, I
  `presented at the CLARO academic conference
  <presentation-dreams-of-flight_>`_.

  .. |claro| replace:: **Dreams of Flight**
  .. _claro: ./dreams-of-flight.pdf
  .. |claro2013| replace:: 2013 edition of *CLARO*
  .. _claro2013: https://www.rrcc.edu/claro/2013

Presentations
=============

|openstandards|_ -- November 2019
  I gave this presentation at the Mines Linux Users Group with `Robby Zampino`_.
  We discussed what standards exist, and why open standards are better than
  closed ones. We also gave a few examples of different open standards in many
  different industries.

  .. |openstandards| replace:: **Open Standards**
  .. _openstandards: https://gitlab.com/sumner/lug-open-standards

|makefiles|_ -- March 2019
  I gave this presentation at the Mines Linux Users Group. I covered the basics
  of GNU ``make`` as well as how to make a ``Makefile``.

  .. |makefiles| replace:: **Makefiles**
  .. _makefiles: https://gitlab.com/sumner/lug-makefiles

|mutt|_ -- February 2019
  I gave this presentation at the Mines Linux Users Group. I covered the basics
  of the Mutt CLI email client. I discussed the basics of using Mutt and some of
  the most useful configurations including how to configure it to be used with
  GPG encryption and signatures.

  .. |mutt| replace:: **Mutt**
  .. _mutt: https://gitlab.com/sumner/lug-mutt

|pgp|_ -- February 2019
  I gave this presentation at the Mines Cybersecurity Club (OreSec) with `David
  Florness`_. We discussed the cryptographic theory behind PGP/GPG such as
  symmetric vs. asymmetric encryption and the PGP protocol.  Then we had an
  interactive time where we showed how to use GPG.

  .. |pgp| replace:: **PGP**
  .. _pgp: https://gitlab.com/sumner/oresec-pgp

|zsh|_ -- January 2019
  I gave this presentation at the Mines Linux Users Group with `Jordan
  Newport`_. We covered ZSH, an alternative shell to BASH. We discussed
  everything from the basics, to some really cool quality-of-life improvements
  which make using the shell enjoyable.

  .. |zsh| replace:: **ZSH**
  .. _zsh: https://gitlab.com/sumner/lug-zsh

|latex|_ -- January 2019
  I gave this presentation at the Mines Linux Users Group with `Joseph
  McKinsey`_.  We gave an extensive introduction to the LaTeX typesetting
  language. We covered everything from the very basics of using LaTeX all the
  way up to advanced LaTeX topics such as using it for presentations!

  .. |latex| replace:: **LaTeX**
  .. _latex: https://gitlab.com/sumner/lug-latex

|i3wm|_ -- March 2017, October 2018
  I gave this presentation at the Mines Linux Users Group. I discussed the
  traditional motif for window management and then presented a better
  alternative: tiling window managers. I presented i3wm, my personal favourite
  tiling window manager. I talked about the pros of using it as well as how to
  use it and customize it.

  .. |i3wm| replace:: **i3wm**
  .. _i3wm: https://gitlab.com/sumner/lug-i3

|idris|_ -- March, June 2018
  I first gave this presentation at the Mines Linux Users Group with `Sam
  Sartor`_. I also gave the presentation for the Wednesday tech talk while
  interning at Pivotal. In both talks, we covered Idris, dependent types, and
  using Idris as a proof assistant.

  .. |idris| replace:: **Idris**
  .. _idris: https://github.com/sumnerevans/lug-idris

|upf|_ -- January 2018
  I gave this presentation at the Mines Linux Users Group with `Robby Zampino`_.
  We covered the background and history of packages and package formats, and
  some of the new *universal package formats*: AppImage, Snaps, and Flatpak.

  .. |upf| replace:: **Universal Package Formats**
  .. _upf: https://github.com/sumnerevans/lug-universal-packages

|fs|_ -- November 2017
  I gave this presentation at the Mines Linux Users Group with `Sam Sartor`_.
  We covered the background and history of filesystems and some current
  filesystems used in Linux, Windows, and macOS. We also covered some more
  fringe filesystems like ``Btrfs`` and ``ZFS`` and network filesystems such as
  Samba and ``sshfs`` as well as virtual filesystems such as ``proc``.

  .. |fs| replace:: **Filesystems**
  .. _fs: https://github.com/sumnerevans/lug-filesystems

|ssh|_ -- February 2017
  I gave this presentation at the Mines Linux Users Group. I discussed what SSH
  is and its applications and then demonstrated how to configure it for easier
  login and management.  Then I briefly talked about how to set up SSH on your
  own server.

  .. |ssh| replace:: **SSH**
  .. _ssh: https://gitlab.com/sumner/lug-ssh

|jscc|_ -- February 2017
  I gave this presentation at the Mines Linux Users Group with `Sam Sartor`_.
  We covered the history of JavaScript, gave an overview of the language
  constructs, and discussed many of the possible pitfalls along the way. We also
  talked about the DOM and HTML5 Canvas manipulation.

  .. |jscc| replace:: **JavaScript Crash Course**
  .. _jscc: https://github.com/sumnerevans/lug-js-crash-course

.. _presentation-dreams-of-flight:

**Dreams of Flight** -- May 2014
  I presented my creative writing piece about Orville and Wilbur Wright at the
  2014 *CLARO* academic conference. I had written this piece for an assignment
  called *A Picture is Worth a Thousand Words*. We were tasked with writing an
  approximately 1000 word narrative from the perspective of a person in a
  significant photo from the 20th Century.

  Watch the video of my `presentation on YouTube
  <https://www.youtube.com/watch/yRGqNewEeoQ>`_.

.. _Ben Perkins: https://www.bencarlson.dev/
.. _Daichi Jameson: https://gitlab.com/daichij
.. _David Florness: https://david.florness.com
.. _Fisher Darling: https://www.darling.dev/
.. _Jack Garner: https://gitlab.com/jhgarner
.. _Jack Rosenthal: https://jack.rosenth.al
.. _Jesus Nuñez: https://gitlab.com/Jnunez101
.. _Jordan Newport: https://jnewport.dev
.. _Joseph McKinsey: https://gitlab.com/josephmckinsey
.. _Nick Jarmusz: https://gitlab.com/nickjar99
.. _Robbie Merillat: https://github.com/BloodRaine
.. _Robby Zampino: https://gitlab.com/robozman
.. _Sam Sartor: https://samsartor.com
