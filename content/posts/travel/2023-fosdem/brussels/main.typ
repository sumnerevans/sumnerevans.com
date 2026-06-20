// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Brussels Sightseeing",
  description: [
    During my time in Brussels for #link("https://sumnerevans.com../fosdem/index.md")[FOSDEM], I took
    the chance to do a bit of sightseeing. Here are some pictures of what I saw.
  ],
  date: datetime(year: 2023, month: 2, day: 3),
  extra: (
    categories: ("Travel",),
    tags: ("Brussels", "Belgium", "Atomium"),
    image: "images/square.jpg",
    build: (
      publishResources: false,
    ),
  ),
)
#show: dir-template

During my time in Brussels for #link("https://sumnerevans.com../fosdem/index.md")[FOSDEM], I took
the chance to do a bit of sightseeing. Here are some pictures of what I saw.

#image("images/church.jpg", alt: "Church of Our Lady of Victories at the Sablon")
