// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Sublime Music, a Linux Subsonic Client, Beta Released",
  date: datetime(year: 2020, month: 7, day: 11),
  extra: (
    categories: ("Projects",),
    tags: ("Sublime Music", "GTK", "Music", "Subsonic", "Airsonic", "Gonic", "Navidrome", "Offline", "Chromecast", "MPRIS", "Linux", "macOS"),
    image: "images/logo.png",
    summary: "Today I'm happy to announce Sublime Music to the world! Sublime Music is a\nfeature-packed native GTK client for Subsonic-compatible servers such as\n[Airsonic](https://airsonic.github.io/),\n[Gonic](https://github.com/sentriz/gonic), and\n[Navidrome](https://www.navidrome.org/). Sublime Music is in beta and version\n0.11.0 is available on the\n[AUR](https://aur.archlinux.org/packages/sublime-music/) and\n[PyPi](https://pypi.org/project/sublime-music/).",
  ),
)
#show: dir-template

/* TODO twyla-convert: hugo shortcode: image src=&quot;images/logo.png&quot; link=&quot;https://sublimemusic.app&quot; width=&quot;50%&quot; */

#html.elem("center")[]

Today I'm happy to announce Sublime Music to the world! Sublime Music is a
feature-packed native GTK client for Subsonic-compatible servers such as
#link("https://airsonic.github.io/")[Airsonic],
#link("https://github.com/sentriz/gonic")[Gonic], and
#link("https://www.navidrome.org/")[Navidrome]. Sublime Music is in beta and version
0.11.0 is available on the
#link("https://aur.archlinux.org/packages/sublime-music/")[AUR] and
#link("https://pypi.org/project/sublime-music/")[PyPi].

#html.elem("h2", attrs: ("style": "text-align:center"))[#html.elem("a", attrs: ("href": "https://sublimemusic.app", "target": "_blank"))[Hooked already? Check out the website!]]



== Background <posts-projects-sublime-music-beta-available-background>

I started using #link("https://airsonic.github.io/")[Airsonic] for hosting my personal
media library a few years ago, but there was one thing missing: a well-designed
client for Linux, so about two years ago, I decided to write my own Subsonic
client. I have worked on Sublime Music on and off since then.

I took design inspiration from my favourite music players including iTunes,
Spotify, and DSub and I also followed the Gnome Human Interface Guidelines to
design the app to look right at home on the Linux desktop.

== Features <posts-projects-sublime-music-beta-available-features>

Sublime Music has many features that differentiate it from the competition:

- *Offline Support:* Download your songs for offline listening. Sublime Music
  also provides an Offline Mode to prevent it from making any network requests.
- *Desktop Integration:* Control Sublime Music using playerctl, KDE Connect,
  and many commonly used desktop environments.
- *Chromecast Support:* Cast music to Google Chromecast and Google Home
  devices on the same network.
- *Linux Native:* Sublime Music is built using the GTK toolkit, so it looks
  right at home on your Linux desktop.
- *Multiple Servers:* You can configure connections to multiple servers and
  switch between them seamlessly.
- And much more!

For more information on the features on the
#link("https://sublimemusic.app/#features")[Sublime Music website]!

== Future <posts-projects-sublime-music-beta-available-future>

Sublime Music is currently in beta, and there are still bugs that need to be
squashed and code cleanup that needs to be done before the Version 1.0 release.
The Version 1.0 release will have everything required for Sublime Music to be
used as a Subsonic client.

Version 2.0 will bring support for using Sublime Music without a \*sonic server.
Users will be able to point Sublime Music at a local directory and Sublime Music
will scan that directory for songs and show them in the UI.

Other future initiatives include:

- *Support for additional backends.* Sublime Music was designed with
  extensibility in mind. Developers can use the
  #link("https://sublime-music.gitlab.io/sublime-music/adapter-api.html")[Adapter API]
  to implement adapters for other music services such as YouTube Music. If
  writing an adapter is something that interests you, join our
  #link("https://matrix.to/#/!veTDkgvBExJGKIBYlU:matrix.org")[Matrix chat] to discuss!
- *Flatpak support.* Currently, Flatpak builds are broken due to dependency
  issues. Once these are fixed, I will try and get Sublime Music on FlatHub.
- *More package formats and platforms.* For example: Snap, AppImage, DMG for
  macOS, MSI installer for Windows.

== Ways to Contribute <posts-projects-sublime-music-beta-available-ways-to-contribute>

You can contribute to Sublime Music in many different ways, including:

- *Tell your friends* about Sublime Music! Word-of-mouth recommendations are
  the best way to spread the word.
- *Join the discussion* on our
  #link("https://matrix.to/#/!veTDkgvBExJGKIBYlU:matrix.org")[Matrix chat]. Discuss
  ideas with, suggest features to, or get help from other users and developers.
- *Report issues or suggest features* on the
  #link("https://github.com/sublime-music/sublime-music/issues")[GitHub repository].
- *Package Sublime Music* for your distribution or operating system. Sublime
  Music is currently packaged for Arch Linux and Debian and is available on
  PyPi. A Flatpak is also in the works. I'm very unfamiliar with other package
  formats, and I'd appreciate help making packages for other distributions and
  operating systems.
- *Write an adapter* for your music service of choice. Note that the interface
  does have many rough edges, so you will likely have to fix bugs in the core
  application as well.
- *Contribute bug fixes or new features* to the core application. Sublime
  Music has many bugs and features that you can work on (check the
  #link("https://github.com/sublime-music/sublime-music/issues")[Issues] page for a
  list).

== Credits <posts-projects-sublime-music-beta-available-credits>

Sublime Music would not be where it is without the support of many people.
Thanks especially to:

- Robozman: for making me a self-hosting junkie, starting this project, giving
  great feedback along the way, and being the first user besides myself.
- sentriz: for many bug fixes and being a great advocate for Sublime Music.
- anarcat and baldurmen: for packaging Sublime Music for Debian.
- deluan: for helping me get Sublime Music working with Navidrome and being a
  great advocate for Sublime Music.

Thanks also to everyone who has reported issues and requested features on
GitHub, interacted in the Matrix chat, or told their friends about Sublime
Music!
