// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "My Adventures in Idris",
  date: datetime(year: 2018, month: 3, day: 7),
  draft: true,
  extra: (
    categories: ("Technology",),
    tags: ("Idris", "Programming", "Programming Languages"),
  ),
)
#show: page-template

Idris is a general purpose, purely functional programming language with
dependent types.
