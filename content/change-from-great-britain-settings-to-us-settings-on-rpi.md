Title: Change from Great Britain Settings to US Settings on RPi
Date: 2013-06-26 16:07
Author: sumner
Category: Technology
Tags: GB Settings, Locale, Raspberry Pi, Technology, US Settings
Slug: change-from-great-britain-settings-to-us-settings-on-rpi
Status: published

One of the most annoying things about the RPi for most of us is that it
was built by Brits. Here are a few of the ramifications of this fact:

1.  By default, the trash can is called the rubbish bin. I don't know
    about you, but I don't normally throw things into the "rubbish bin",
    I throw them into the "trash can"
2.  I don't want to use British servers with British language repos when
    I use `sudo apt-get update` etc.

How do we make the RPi recognize that we aren't Brits? Well, we need to
change the locale to en\_US. Here's how to do that:

1.  Run this command `sudo raspi-config` in a terminal
2.  Use your keyboard to
    [navigate](http://en.wikipedia.org/wiki/Navigation "Navigation"){.zem_slink}
    to the `Internationalization Options` item and press
    <kbd>enter</kbd> or <kbd>return</kbd> on your keyboard
3.  Navigate to the<!--more--> `Change Locale` item and press
    <kbd>enter</kbd> or <kbd>return</kbd> on your keyboard
4.  After it loads (it might take a second) scroll down to the `en_*`
    section using the <kbd>up</kbd> or <kbd>down</kbd> arrows on your
    keyboard
5.  Notice that `en_GB.UTF-8 UTF-8` is selected. Navigate to that entry
    and press the <kbd>spacebar</kbd> to deselect it
6.  Go down to `en_US.UTF-8 UTF-8` and press the <kbd>spacebar</kbd> to
    select it
7.  Press <kbd>tab</kbd> and then press <kbd>enter</kbd> or
    <kbd>return</kbd> on your keyboard
8.  The wizard will now ask you what to use as the default locale for
    the system. Navigate using your keyboard keys to `en_US.UTF-8 UTF-8`
    and then press the <kbd>right arrow key</kbd> and then press
    <kbd>enter</kbd> or <kbd>return</kbd> on your keyboard
9.  After it finishes (this takes a little while) you will be sent back
    to the main `raspi-config` dialog. To exit, press the <kbd>right
    arrow key</kbd> twice and then press <kbd>enter</kbd> or
    <kbd>return</kbd> on your keyboard

Now you have set your RPi to use the US locale. You no longer have to
send things to the "rubbish bin", rather, you will be sending things to
the "trash can". Also, you will get all of your stuff from
`apt-get update` etc. from the US servers.
