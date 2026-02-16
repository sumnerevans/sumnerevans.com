---
title: FOSDEM 2025
date: 2025-02-02T06:25:00-06:00
categories:
  - Travel
  - Conferences
tags:
  - FOSDEM
  - Matrix
  - HSBXL
  - Go (Programming Language)
  - Brussels
  - Belgium
description: |
  For the third year in a row, I attended FOSDEM. I attended the Matrix
  community meetup as well as many talks at the main conference.
image: images/matrix.jpg
build:
  publishResources: false
---

For the third year in a row, I attended [FOSDEM](https://fosdem.org/2025/), a
Free and Open Source Software conference. I enjoyed the previous
[two]({{<ref"../../2023-fosdem/fosdem/index.md">}})
[years]({{<ref"../../2024-fosdem/fosdem/index.md">}}), and Automattic paid for
me to attend, so I decided to make the hop across the pond to attend again.
FOSDEM is one of the main gatherings of the Matrix community every year
(probably second only to the [Matrix Conference](https://2024.matrix.org/)), and
there is also a sizeable Go presence at the conference as well.

This year, both Brad and [Tulir](https://mau.fi/) attended from Beeper, and even
more from the wider Automattic company.

## Matrix Community Meetup

{{<figure src="images/matrix.jpg" title="The Matrix Community Meetup">}}

On the Friday before FOSDEM, the Matrix community once again hosted a community
meetup at HSBXL. HSBXL has moved since last year to a new location that is a
much nicer space. Probably nearly of hundred people were in attendance including
prominent members of the community such as Matthew and Greg Sutcliffe (the
Matrix Governing Board Chair). Tulir and I headed over in the early afternoon
and by the time we arrived, the meetup was in full-swing. My friends
[Sam](https://samsartor.com/) and Aiden from Colorado also attended.

I had good conversations with many community members throughout the afternoon
and evening. [Yan](https://www.linkedin.com/in/yncyrydybyl/) and
[Kim](https://github.com/harharlinks) once again did a fantastic job organizing
the meetup as a barcamp with an ad-hoc schedule based on the interests of the
people in attendance.

Some of the highlights of the meetup were:

- Speaking to Kegan about the interesting work that he is doing to change the
  way that federation works in Matrix, and the tooling that he is working on to
  test federation.
- I met Greg Sutcliffe in-person for the first time. Greg is the Chair of the
  Matrix Governing Board and is working to build the infrastructure necessary
  for a stable and effective Board.
- I was able to speak with many regulars at Matrix events such as Kim, Yan, Ben,
  Asbjørn, Bram, and Nico who I have had the pleasure of interacting with at
  many previous events. I was also able to meet new entrants into the community
  such as an individual from Canada who also made the hop across the pond to
  attend FOSDEM.
- I spoke extensively with Florian about the cool WebRTC work that Element is
  doing with Element Call, and I met Robin and Timo who on the team pushing that
  work forward.
- Brad, Tulir, and I spoke with Erik about the interesting work that Element is
  doing with Synapse Pro to optimize Matrix for large deployments.
- During one of the barcamp sessions, I spoke with a few other homeserver
  administrators about the challenges they face maintaining a fast and reliable
  homeserver.

The meetup still hadn't disbursed well into the evening, and considering I was
still somewhat tired from travel and the next day would be a full one, I decided
to call it a night.

## Go Dev Room

On Saturday, I made my way in a packed tram car to the Université libre de
Bruxelles (ULB) to attend the entirely full Go dev room. Tulir arrived a few
minutes after me, and we settled in for the talks. The first talk was by Maartje
about the state of Go and highlighted the new features we got in the last year.
A few highlights are:

- I think that the biggest change since last year is the rangefunc changes where
  you can define custom iterators. At Beeper, we support the latest two Go
  versions, and with the recent release of Go 1.24, we can now use that
  functionality in our projects since it was stabilized in Go 1.23.
- In Go 1.24, we get `debug.ReadBuildInfo()` which will provide a way to get the
  git commit hash and tag for the build which is something that a lot of people
  do manually with build tags right now.
- I'm excited about `go tool` which allows you to specify tools in `go.mod`.
  This will be especially useful for things like `staticcheck` as I will no
  longer need to install it user-wide, and instead will be able to have a
  specific version specified on a per-project basis.
- In Go 1.24, `crypto/hkdf` is being moved from `/x/crypto` and being stabilized
  in the `crypto` module.
- In Go 1.24 we get a new `os.RootPath` function which provides a safe way to
  expose the filesystem without worrying about escaping using `../`.
- In Go 1.24 there is a new `omitzero` option for JSON encoding which sounds
  very useful. At Beeper, we often have to make fields pointers just so they can
  be set to `nil` and omitted using `omitempty`. This `omitzero` option sounds
  like it will fix this issue.

The next talk was about the internals of Go generics. Anton described how
various languages have implemented generics and how Go chose a hybrid approach.
The two main camps are stencilling (which is what C++ does), and dictionaries.
With stencilling, a new version of the generic function is created for every
type that the generic function is called with. With dictionaries, a struct
containing the type-specific operations of the generic function is created and
passed into a single generic implementation. Go chose a middle route, where
there is stencilling based on garbage collection (GC) shape, but within a given
GC shape, dictionaries are used.

The morning continued with deep dives into Go internals with a talk about Swiss
maps in Go. Swiss maps are so called because they use Closed Hashing which is
abbreviated CH which is also the country code of Switzerland. (It also helps
that the majority of the team working on this are based in Zurich.) I didn't
fully understand how it all worked, but the things that I gathered were:

1. Given a hash, there are three levels of associativity. The first 2 bits of
   the hash determine which entry in the directory should be used. The middle 55
   bits (modulo the number of buckets) are used to determine which bucket the
   hash belongs in, and the last 7 bits are stored in a metadata array to
   determine which element in the bucket has a matching hash.
2. When trying to determine if a key matches, every element in the metadata
   array must be compared to the last 7 bits of the hash. This operation can be
   done in parallel using Single Instruction, Multiple Data (SIMD) operations.

Unfortunately, in some real-world tests it appears that Swiss maps don't provide
significant performance improvements.

An interesting tidbit that was mentioned is that Go's maps have never been
guaranteed to iterate in the same order. Although the previous implementation
could provide a stable iteration order, a random seed was added so that
developers would not rely on that fact. This allows the Go team to change the
way that iteration works without breaking any (even implicit) language
guarantees.

## Finding More Matrix Folks

The next two talks were not as interesting and my brain was getting overloaded,
so I don't remember much about those talks. I was also getting hungry by this
point, and so I made my way out to the food trucks that are brought in every
year to feed the masses of nerds attending the conference. I got some Penne
Bolognese and after eating it, I headed over to the Matrix booth in building K.
I walked around some of the other booths as well, and collected some stickers. I
caught up with some other Matrix community members congregating around the
booth.

Eventually, Tulir and I decided that it was time for waffles. We went back to
the food trucks where there is a Belgian waffle truck which serves
chocolate-covered waffles with whipped cream. It was very good.

After spending a little more time talking to people at the Matrix stand, I
headed back to the hotel for a rest.

Later that evening, Tulir, Brad and his fiancé Jane, and myself went to dinner
at their hotel restaurant. The food was good, but the service was initially slow
as it took quite a while for them to bring us a menu. My steak was definitely
worth the wait, though.

After dinner, Brad, Tulir and myself walked downtown to meet up with some
Element folks at a bar. I had interesting conversations about a variety of
topics with Neil, Rich, Eric, Will, and others. I enjoyed speaking with all of
them, but I think the highlight for me was my discussion with Neil. We discussed
how the Governing Board can help illuminate blind-spots that Element has, and
how Element can help the Governing Board understand the broader context of the
ecosystem and the difficulties faced by Matrix.org.

## Matrix Booth and Devroom

On Sunday, I volunteered at the Matrix stand during the morning. It was fun
talking to the people who wandered by the Matrix stand. Some were interested in
learning more about Matrix, while others were already users merely in search of
cool swag and stickers.

In the afternoon, I went to the Matrix devroom. I especially enjoyed the Matrix
State of the Union talk. It was cool to see Timo present some of the work he has
been doing with the Rust SDK. I also enjoyed the demo of the work that
[Kegan](https://github.com/kegsay) is doing to test federation. Another
highlight was [Erik](https://github.com/erikjohnston)'s talk about the state of
Synapse and the work they are doing to improve it both for community use-cases
and large-scale deployments in places like government. It was also fun to see
[Kevin](https://github.com/kevinaboos)'s presentation about Robrix which is a
new Matrix client developed by Futurewei.

During the afternoon, some other Automattic employees who were attending the
conference messaged and we met with them briefly. It was fun to see other people
from the company in-person!

After the dev room, I hung out around the Matrix boot for a while, and then
Tulir, Kim, Sam, Aiden, and myself went to get dinner. We went to a burger place
that was quite good, and it was nice to finally have a chance to catch up with
Kim. Unfortunately, my Eurostar back to London left at 20:50, so I had to say
goodbye and leave dinner early.

---

Overall, I greatly enjoyed my time at FOSDEM. I always enjoy interacting with
the Matrix and Go communities. I feel like I consistently learn something
interesting in the Go dev room, and hear about some new exciting development in
Matrix at the Matrix dev room.

But most importantly, I enjoy interacting with the fantastic people in
attendance. I've made many friends at these events, and I hope to continue
having the opportunity to come and participate in these events.
