---
title: "Introducing offlinemsmtp"
date: 2019-12-07T13:00:00-06:00
categories: [Projects]
tags: [offline, msmtp, email, mutt]
image: ./images/offlinemsmtp-no-pad.png
---

I use a program called |mutt|_ for managing my email. A lot of the time, I want
to download all of my messages and use ``mutt`` offline (for example, when I'm
on the train commuting to work). In these cases, I also want to be able to queue
email messages to send once I get back online. Even when I am online, sometimes
the process of sending the message can take a while (with a large attachment,
for example), and I don't want ``mutt`` to freeze while the email is being sent.

For downloading messages for viewing offline, I use a program called ``mbsync``
which is part of the |isync|_ project. However, I could not find a program to
replace ``msmtp`` (the program that is normally used to send email from within
``mutt``). So, naturally I wrote my own program to handle this:

.. image:: ./images/offlinemsmtp-no-pad.png
   :target: ./images/offlinemsmtp-no-pad.png
   :alt: offlinemsmtp
   :align: center

.. |mutt| replace:: ``mutt``
.. _mutt: http://www.mutt.org/
.. |isync| replace:: **isync**
.. _isync: http://isync.sourceforge.net/

``offlinemsmtp`` has two components:

1. A daemon which listens for changes to the configured outbox folder on the
   local filesystem. When a new message appears in the outbox folder,
   ``offlinemsmtp`` sends the email immediately if the server is available. At a
   configurable interval, ``offlinemsmtp`` attempts to send the emails that are
   still in the folder (due to not having been sent earlier).

2. An enqueuer for adding mail messages to the outbox folder.

Once you have configured both of these components, ``offlinemsmtp`` is a drop-in
replacement for ``msmtp`` in ``mutt``. So, if your ``sendmail`` configuration
was::

    set sendmail = "msmtp -a personal"

with ``offlinemsmtp`` it would become::

    set sendmail = "offlinemsmtp -a personal"

You can find more information about ``offlinemsmtp`` and its configuration
options at the `project's GitHub page <github_>`_.

.. _github: https://github.com/sumnerevans/offlinemsmtp

``offlinemsmtp`` version ``0.3.5``, is available via PyPi_ and the AUR_.

.. _PyPi: https://pypi.org/project/offlinemsmtp/
.. _AUR: https://aur.archlinux.org/packages/offlinemsmtp/
