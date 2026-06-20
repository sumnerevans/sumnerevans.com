// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Introducing offlinemsmtp",
  date: datetime(year: 2019, month: 12, day: 7),
  extra: (
    categories: ("Projects",),
    tags: ("offline", "msmtp", "email", "mutt"),
    image: "images/offlinemsmtp-no-pad.png",
    hide_image_in_index: true,
  ),
)
#show: dir-template

/* TODO twyla-convert: hugo shortcode: image src=&quot;images/offlinemsmtp-no-pad.png&quot; link=&quot;https://github.com/sumnerevans/offlinemsmtp&quot; width=&quot;50%&quot; */

#html.elem("center")[]

I use a program called #link("http://www.mutt.org/")[`mutt`] for managing my email. A
lot of the time, I want to download all of my messages and use `mutt` offline
(for example, when I'm on the train commuting to work). In these cases, I also
want to be able to queue email messages to send once I get back online. Even
when I am online, sometimes the process of sending the message can take a while
(with a large attachment, for example), and I don't want `mutt` to freeze while
the email is being sent.

For downloading messages for viewing offline, I use a program called `mbsync`
which is part of the #link("https://isync.sourceforge.io/")[isync] project. However, I
could not find a program to replace `msmtp` (the program that is normally used
to send email from within `mutt`). So, naturally I wrote my own program to
handle this:

`offlinemsmtp` has two components:

+ A daemon which listens for changes to the configured outbox folder on the
  local filesystem. When a new message appears in the outbox folder,
  `offlinemsmtp` sends the email immediately if the server is available. At a
  configurable interval, `offlinemsmtp` attempts to send the emails that are
  still in the folder (due to not having been sent earlier).
+ An enqueuer for adding mail messages to the outbox folder.

Once you have configured both of these components, `offlinemsmtp` is a drop-in
replacement for `msmtp` in `mutt`. So, if your `sendmail` configuration was:

```vim
set sendmail = "msmtp -a personal"
```

with `offlinemsmtp` it would become:

```vim
set sendmail = "offlinemsmtp -a personal"
```

You can find more information about `offlinemsmtp` and its configuration options
at the #link("https://github.com/sumnerevans/offlinemsmtp")[project's GitHub page].

`offlinemsmtp` version `0.3.5`, is available via
#link("https://pypi.org/project/offlinemsmtp/")[PyPi] and the
#link("https://aur.archlinux.org/packages/offlinemsmtp/")[AUR].
