// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Use Custom Themes on the Free Version of ObjectBar",
  date: datetime(year: 2013, month: 2, day: 8),
  extra: (
    Categories: ("Technology",),
    Tags: ("Custom Themes", "ObjectBar", "ObjectBar Free"),
  ),
)
#show: page-template

One of the worst things about ObjectBar Free is that you can't use custom
themes. You are limited to the themes that ship with the free version. When you
try to use the theme selector to select a different theme (such as one that
you've installed), ObjectBar tells you that you have to buy the full version of
the program to use the theme. Well, I'm here to tell you that that is not the
case.  You _can_ use any theme that you want.

To use your own theme, follow these steps:

+ Get the theme you want.
+ Copy the files to the root of ObjectBar's program files directory.  It
  should be something like
  `C:\Program Files\Stardock\Object Desktop\Objectbar` (for 32-bit) and
  `C:\Program Files (x86)\Stardock\Object Desktop\ObjectBar` (for 64-bit)
+ Run ObjectBar (if it isn't running already). Restart ObjectBar if it
  is running.
+ Right click on anything except for an item on the bar and select "Theme
  Editor...".
+ Select the "Skin" tab.
+ Click on "Change Skin...".
+ Select "Use a skin from another theme:".
+ Select the theme from the "Theme" dropdown, and select the skin from
  the "Skin" dropdown
+ Enjoy knowing that you just got in to ObjectDock's theme manager through the
  back door. :)
