---
title: Learning Typst
date: 2025-10-11T06:25:00-06:00
categories:
  - Programming
tags:
  - Typst
  - Resume
  - LaTeX
  - LLM
math: true
aliases:
  - ../my-resume-is-typst
---

A few weeks ago, [Typst](https://typst.app/) came back on my radar because of
[Sylvan Franklin](https://www.youtube.com/@sylvanfranklin)'s videos on the topic
came into my YouTube feed. In particular,
[_Rewriting my resume in Typst_](https://www.youtube.com/watch?v=Bwo1oX4wapE) in
which he rewrites his resume from \(\LaTeX\) to Typst piqued my interest. I have
maintained [my resume](https://github.com/sumnerevans/resume) in \(\LaTeX\)
since I started at Mines in 2016, and so I figured this would be an opportunity
for me to learn something new.

It took the better part of a few evenings for me to figure out how to translate
my resume to Typst, but I'm happy with the result. I was able to reproduce the
style of my \(\LaTeX\) resume almost exactly, and the code felt significantly
more readable. (It's pretty easy to be more readable than \(\LaTeX\) to be
honest.) My resume is now written in Typst and compiled with Nix using
[Typix](https://loqusion.github.io/typix/). It is automatically compiled by
GitHub Actions, and a PR is automatically created against my website to update
the resume linked from [my portfolio]({{<ref"../../portfolio/index.md">}}).

Of course, my resume is not a very complicated document, but a few highlights of
the entire process were:

- **Typst is very fast.** Compilations of the PDF were effectively instant. This
  is far cry from \(\LaTeX\), even on a small document where the compilation
  time was still ~10s.
- **Typst is small.** Unlike \(\LaTeX\) which is a famously enormous package
  (most distributions are gigabytes in size), Typst is under 40MB. This means
  that it is reasonable to download the executable during every single CI
  pipeline run.
- **The function syntax is reasonable.** It's not the best syntax, but it exists
  and is actually readable (unlike most \(\LaTeX\) macros). I'm still not sure
  how to utilise all of their functionality, but at least I have hope that I
  could understand the entire syntax without getting a PhD in typesetting.
- **The Nix integration is great.** This is a testament to
  [loqusion](https://loqusion.dev)'s work on Typix more than anything. Typix
  provides a feature-rich integration between Nix and Typst, which I found easy
  to use and configure to my needs.
- **Typst packages seem cool.** It seems like there's packages for lots of
  things on [Typst Universe](https://typst.app/universe/), and defining a custom
  package seems more straightforward than in \(\LaTeX\).
- **The [Tinymist LSP](https://myriad-dreamin.github.io/tinymist/) is
  competent.** It provides auto-completion and documentation of functions, has
  the ability to go to definition, integrates with Typst formatters, and can
  automatically compile the PDF on every keystroke. These are huge
  quality-of-life improvements over \(\LaTeX\) LSPs which are lackluster at
  best.

I still need to try Typst for a presentation and see if it's a good alternative
to Beamer and Google Slides (which I've used for a few more recent
presentations). I also would like to find an excuse for writing more technical
documents using Typst, but I feel like I'm mostly in Confluence and Outlook Hell
at this point in my career.

---

After this positive experience with Typst, it got me thinking: why did I not
investigate Typst earlier? I'd actually heard about Typst a few years back from
a couple of friends from school, but had never gotten around to trying it out.

I think a big reason I never used it was because by the time it came to my
attention I was out of school, and so I wasn't actively writing any PDF reports
or documents. I did write some presentations in the last few years using
\(\LaTeX\) with the [Beamer package](https://ctan.org/pkg/beamer?lang=en)
because I was very comfortable using it and I didn't really feel like investing
the time into learning something new. I also have been
[teaching Algorithms]({{<ref"../../portfolio/index.md#experience-adjunct-mines">}})
where the assignments are required to be typset so I have helped many students
learn \(\LaTeX\) over the past few years. I consider myself to be marginally
competent at using \(\LaTeX\)[^1] so the activation energy required for me to
learn a replacement is nontrivial.

I think that it comes down to this: _the more competent you are at something,
the higher the cost to switching to a replacement_. To me, I think that the
perceived benefit of switching has to be at least a 25% improvement over my
current tooling/workflow.

I'm seeing this play out in my approach to LLM-assisted programming. I have
spent years optimizing my programming workflow and improving my skills as an
engineer. When I was a student and early in my career, it was pretty easy to
find workflow optimisations that had the potential to increase my productivity
by 25% or more. However, after years of honing my craft, the bar is very high
for adopting new workflow optimisations[^2]. Thus, it has been difficult for me
to find motivation to adopt LLMs because it is not immediately obvious to me
that it will improve my workflow enough.

However, I think that this experience dabbling with Typst has shown me an
obvious "hack" to reduce the activation energy required to try a new tool:
**start with something small**. So, I'm going to try and resurrect the latest
"workflow optimisation nerd" within me on some small projects that would benefit
greatly from LLM assistance. I may or may not write about it, but if I do, you
might even see some articles without the "Not by AI" badge because it's possible
I decide to try writing some articles with heavy use of LLMs.

[^1]: I am by no means an expert, but I am more or less passable for most
    basics.

[^2]: For example, the most recent large workflow improvement that I can think
    of was my adoption of the
    [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) framework for
    managing LSPs instead of CoC, and I did that in late 2023.
