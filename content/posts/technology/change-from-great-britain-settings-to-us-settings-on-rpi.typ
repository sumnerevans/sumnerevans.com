// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Change from Great Britain Settings to US Settings on RPi",
  date: datetime(year: 2013, month: 6, day: 26),
  extra: (
    Categories: ("Technology",),
    Tags: ("GB Settings", "Locale", "Raspberry Pi", "US Settings"),
  ),
)
#show: page-template

One of the most annoying things about the RPi for most of us is that it
was built by Brits. Here are a few of the ramifications of this fact:

+ By default, the trash can is called the rubbish bin. I don't know about you,
  but I don't normally throw things into the "rubbish bin", I throw them into
  the "trash can"
+ I don't want to use British servers with British language repos when I use
  `sudo apt-get update` etc.

How do we make the RPi recognize that we aren't Brits? Well, we need to change
the locale to en\_US. Here's how to do that:

+ Run this command `sudo raspi-config` in a terminal
+ Use your keyboard to navigate to the `Internationalization Options` item and
  press #html.elem("kbd")[enter] or #html.elem("kbd")[return] on your keyboard
+ Navigate to the `Change Locale` item and press #html.elem("kbd")[enter] or
  #html.elem("kbd")[return] on your keyboard
+ After it loads (it might take a second) scroll down to the `en_*` section
  using the #html.elem("kbd")[up] or #html.elem("kbd")[down] arrows on your keyboard
+ Notice that `en_GB.UTF-8 UTF-8` is selected. Navigate to that entry and
  press the #html.elem("kbd")[spacebar] to deselect it
+ Go down to `en_US.UTF-8 UTF-8` and press the #html.elem("kbd")[spacebar] to select
  it
+ Press #html.elem("kbd")[tab] and then press #html.elem("kbd")[enter] or #html.elem("kbd")[return] on
  your keyboard
+ The wizard will now ask you what to use as the default locale for the
  system. Navigate using your keyboard keys to `en_US.UTF-8 UTF-8` and then
  press the #html.elem("kbd")[right arrow key] and then press #html.elem("kbd")[enter] or
  #html.elem("kbd")[return] on your keyboard
+ After it finishes (this takes a little while) you will be sent back to the
  main `raspi-config` dialog. To exit, press the #html.elem("kbd")[right arrow key]
  twice and then press #html.elem("kbd")[enter] or #html.elem("kbd")[return] on your keyboard

Now you have set your RPi to use the US locale. You no longer have to send
things to the "rubbish bin", rather, you will be sending things to the "trash
can". Also, you will get all of your stuff from `apt-get update` etc. from the
US servers.
