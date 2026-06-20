// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Forget MCP, Write CLI Apps",
  date: datetime(year: 2025, month: 12, day: 2),
  extra: (
    categories: ("Programming",),
    tags: ("CLI", "LLM", "MCP", "Claude"),
  ),
)
#show: page-template

Over the last month or so, I've been using
#link("https://claude.com/code")[Claude Code] for assisting with development tasks\[^1\].
One of the things that has confused me the most about the LLM-assisted
programming ecosystem is the
#link("https://modelcontextprotocol.io/docs/getting-started/intro")[Model Context Protocol (MCP)]
landscape. In theory, MCP is a way to provide the LLM with data from an external
system through a structured protocol. However,
#link("https://youtu.be/1piFEKA9XL0")[it] #link("https://youtu.be/hPPTrsUzLA8")[sucks].
It turns out that it is more efficient to have the AI just write code to analyse
and manipulate the data from the external system directly. Rather than piping the
data from the external system into the LLM's context window and letting the LLM
muddle through it, the LLM-written code can just do the necessary data processing.
Computers have been good at running instructions on large datasets for a very long
time and AI is not going to be a substitute for that.

\[^1\]: We have chosen Claude as the AI of choice at
#link("https://sumnerevans.com../../portfolio/index.md#experience-canam-tech-lead")[my job] and
I have been using it both at work and for some side projects.

But what would be even better than having the AI write ad-hoc code to interact
with the external system? Just provide a fully-featured CLI for that external
system! With a competently built CLI application, the LLM does not have to guess
about the functionality of the external system when writing ad-hoc code.
Instead, it can interact with it in a highly-structured, text-based way via the
command line.

In my short time using Claude, I've noticed this in practice in a few
situations:

- Claude loves to use the #link("https://cli.github.com/")[GitHub CLI] to interact with
  GitHub. The GitHub CLI is a very full-featured program that allows you to
  interact with pretty much every part of GitHub through the GraphQL API.
- Claude is quite fond of using classic GNU utils like `sed`, `awk`, and `grep`.
  These CLIs have been around forever, are highly stable, and very powerful. I
  don't know all the flags or how to write proper `awk` or `sed` actions, but
  the internet does, and thus so does Claude.
- Claude is very adept at using the command line for building code, running
  tests, etc. I've been using Claude in both the Go ecosystem and the .NET
  ecosystem, and both have pretty good command line tooling\[^2\].

\[^2\]: .NET has gotten a lot better since the .NET Framework days (which was the
last time I was seriously using .NET). They got off of reliance on
horrifying combinations of `msbuild` commands and now have a `dotnet`
command which is competent.

I think it's fairly clear that the main reason that CLIs are so LLM-friendly is
that CLIs are text-based, and thus there are no wasted tokens from mode
transformations. As we enter the age of LLM-assisted software engineering, I
think it is going to be essential for developer tooling to be CLI-native. As
someone has invested a lot of time learning to use the command line as much as I
can for my computing, this is quite vindicating.

It is also quite vindicating for the UNIX philosophy which states (in part) that
"programs should expect their output to be the input to another, as yet unknown,
program" and that "programs should be written to handle text streams, because
that is a universal interface". It turns out that CLI applications which
followed the UNIX philosophy ended up being the most immune replacement in the
AI revolution.

#html.hr()

*Note 18 May 2026:* I'm collecting a list of other blog posts that have the same
sentiment as this post below.

- #link("https://ejholmes.github.io/2026/02/28/mcp-is-dead-long-live-the-cli.html")[MCP is dead. Long live the CLI]
  by #link("https://ejholmes.github.io/")[Eric Holmes]
- #link("https://mariozechner.at/posts/2025-11-02-what-if-you-dont-need-mcp/")[What if you don't need MCP at all?]
  by #link("https://mariozechner.at/")[Mario Zechner]
