// twyla-convert draft. Manual cleanup expected!
// Inspect any TODO markers below

#import "/templates/lib.typ": *

#set document(
  title: "Why I Migrated to Sourcehut and Why You Should, Too",
  date: datetime(year: 2021, month: 3, day: 5),
  draft: true,
  extra: (
    Categories: ("Technology",),
    tags: ("Source Control", "CI/CD", "sourcehut", "Open Source"),
    build: (
      publishResources: false,
    ),
  ),
)
#show: dir-template

Over the past few years, mainstream git hosting services such as GitHub, GitLab,
and Bitbucket have become more and more bloated and locked-in. For example, the
recently added #link("https://github.com/sponsors")[GitHub Sponsors] feature is both unnecessary and a
potential vector for vendor lock-in. Other examples include the security and
compliance features that both #link("https://github.com/features/security")[GitHub] and #link("https://about.gitlab.com/handbook/engineering/security/security-assurance/security-compliance/compliance.html")[GitLab] have
integrated in the past few years. Some even argue that the pull request itself
is feature bloat. This is a reasonable stance considering git was designed to
accommodate email-only workflows such as the Linux developer mailing list.

Feature bloat is not the only worrying trend. Over-reliance on JavaScript for
page functionality is also an issue. Both GitHub and GitLab are now basically
single-page web applications requiring large amounts of JavaScript to have any
reasonable functionality. Not only does JavaScript introduce additional page
load latency, but it also introduces privacy concerns due to increased tracking
and enables regressive features such as enabling websites to capture key events,
overriding user-defined and plugin-defined keybindings. The over-reliance on
JavaScript also presents challenges for accessibility.

In addition to these concerning technical issues, there are social and economic
issues that accompany commercial git hosting services. GitHub has been pushing a
left-wing social agenda including encouraging users to adopt the #link("https://itsfoss.com/linux-code-of-conduct/")[highly
controversial] and #link("https://twitter.com/CoralineAda/status/1041465346656530432")[overtly political]
_Contributor Covenant_ as the default Code of Conduct. (The author of the
_Contributor Covenant_ is a #link("https://modelviewculture.com/pieces/the-dehumanizing-myth-of-the-meritocracy")[vocal opponent of meritocracies] --
an essential social structure for writing and maintaining quality software.)
Censorship is also on the rise in commercial git hosting platforms. For example,
#link("https://www.eff.org/deeplinks/2020/11/github-youtube-dl-takedown-isnt-just-problem-american-law")[GitHub took down the youtube-dl repo] _without notifying the
developers_ due to a #link("https://github.com/github/dmca/blob/master/2020/10/2020-10-23-RIAA.md")[DMCA request by record labels]. Although GitHub
#link("https://github.blog/2020-11-16-standing-up-for-developers-youtube-dl-is-back/")[revamped their policies after that incident], and claim to be
on the side of developers, time will tell whether they live up to their
promises. Even if GitHub does end up defending developers, the fact that the
project is entirely dependant on GitHub for collaboration, and GitHub is able to
take down repos at will, is problematic. On the economic side, the main revenue
streams GitLab come from enterprise contracts which means that they are not
beholden to the individual users of their software. While it is less clear how
profitable GitHub is, Microsoft did not buy them merely for charitable purposes.
Microsoft (and its shareholders) clearly see extractable value in the Open
Source communities that GitHub hosts. Regardless of whether that comes in the
from of data mining, advertising (remember, Microsoft also owns LinkedIn),
encouraging the use of Azure, or any other scheme, it's a concerning trend.

However, possibly one of the greatest concerns with the dominance of commercial
git hosting services is the fact that the are not fully open source. GitHub is
entirely closed source. GitLab is #link("https://about.gitlab.com/blog/2016/07/20/gitlab-is-open-core-github-is-closed-source/")[open core] under the MIT license.

Given these concerns, I have been searching for viable alternatives to GitHub
and GitLab for some time. Fully open source projects such as #link("https://gitea.io/en-us/")[Gitea]
caught my eye, but they tend to just try and clone the functionality of GitHub
and GitLab rather than introducing something novel.

My search ended up landing on #link("https://sourcehut.org")[sourcehut]: a fully open source
(mostly under the AGPLv3), lightweight, privacy-respecting alternative to the
dominant git hosting services. Sourcehut makes the mailing list patch workflow
first-class by providing a friendly interface on top of the mailing list
workflow, and by adding CI/CD build infrastructure, ticket tracking, wikis, and
many other nice features.

Sourcehut is funded by its users (accounts will begin costing money after the
beta period). This may be a turn-off to some people who care more about having
monetarily free services, but I would rather pay a bit extra for the assurance
that my data is not being sold. (And I could always just self-host if I thought
the pricing structure was getting out-of-hand.)

You may already be convinced to give sourcehut a try, but if you aren't I'll use
the rest of the post to describe some of my favourite features. In order to do
that, though, we have to take a look at the various services that I've tried in
the past.

== My Git Hosting Service Journey <posts-technology-migrating-to-sourcehut-my-git-hosting-service-journey>

I have used many git hosting services over the years. I used Atlassian's
Bitbucket for a while in high school because they provided free private
repositories. Once I started college and got the GitHub Student Pack (which
provides free GitHub Premium), I moved my repositories over to GitHub.

When Microsoft acquired GitHub, I decided to try GitLab. (I don't necessarily
have a problem with Microsoft, but the acquisition was a good reminder that
GitHub is closed source software.) I found that the feature-set of GitLab was
greatly superior to GitHub. For example, at the time, GitHub did not have any
integrated CI/CD functionality, whereas GitLab did. (GitHub has since added
GitHub Actions, but that came more than a year after I switched to GitLab). I
continued using GitLab as my primary git hosting service for a few years.

During college, I became interested in open source software and self-hosting my
personal infrastructure. Many of my friends are also interested in these topics,
and we also became interested in the mailing list workflow used by the Linux
kernel (although we knew very little about how it worked). One of the main
appeals to us at the time was that mailing lists (which are the core of the
sourcehut collaboration workflow) are #link("https://sourcehut.org/blog/2020-10-29-how-mailing-lists-prevent-censorship/")[resilient to
censorship]. A little over a year ago we encountered
sourcehut and stared exploring it. At the time, I tried it out for a little
while, but found the workflow strange (mainly because I wasn't used to it). I
was also at the time still generally satisfied with GitLab.

The event that finally got me to take the time to learn the mailing list git
workflow and switch to sourcehut came last year when GitLab added a "feature"
that focuses the GitLab search bar when you type slash (#html.elem("kbd")[/]) anywhere
on the webpage (besides when focused on a text box). This is totally
unacceptable since I use an extension (Tridactyl) which adds Vim bindings for
many browser features. One of the bindings that it adds is making #html.elem("kbd")[/]
activate the browser's "find in page" functionality. By capturing #html.elem("kbd")[/],
GitLab prevents me from using the browser's built-in "find in page"
functionality on their site (#html.elem("kbd")[Ctrl]+#html.elem("kbd")[F] is bound to a
different feature in Tridactyl). This makes GitLab unbearable to use since I use
"find in page" functionality extensively.

Due to this major usability regression, I decided to take the time to learn the
mailing list workflow and migrate to sourcehut.

== The Mailing List Git Workflow <posts-technology-migrating-to-sourcehut-the-mailing-list-git-workflow>

Linus Torvalds designed git to facilitate collaboration on the Linux kernel
using the kernel mailing list. As such, git ships with built-in tools for
collaborating over email. Drew DeVault's #link("https://git-send-email.io/")[git-send-email.io] explains how
to use the `git send-email` command for sending patches to a mailing list.

One misconception that I had about the mailing list workflow was that `git push`
is not used anymore. This is not the case. The project maintainer (or anyone
with write access to the repository) is able to push changes directly to the
repository. Only external collaborators need go through the mailing list to
submit patches. After receiving a patch on the mailing list, the project
maintainer can choose to apply the patch to the repository (they do this using
the `git am` command), and then push the added changes. Patches are linked with
email addresses, so commit attribution still works as expected. This workflow is
actually very similar to the pull/merge request workflow of GitHub/GitLab, but
it has one huge advantage: the external collaborator does not need to sign up
for any service! They also do not need to use a web UI to submit the patches.

#image("images/mailing-list.png", alt: "sourcehut's mailing list interface")

== It's Simple and Lightweight <posts-technology-migrating-to-sourcehut-its-simple-and-lightweight>

With sourcehut, #link("https://sourcehut.org/blog/2020-04-20-prioritizing-simplitity/")[simplicity] is priority. This applies to the
feature set as well as the visual design. The feature bloat problems of GitHub
and GitLab are not a problem with sourcehut. Although functionality such as
#link("https://drewdevault.com/2019/07/08/Announcing-annotations-for-sourcehut.html")[code annotations] have been added, they have been integrated in a way
that is generic and easily portable to other systems (should you choose to leave
sourcehut).

The primary developer of sourcehut, Drew DeVault, describes the visual design of
sourcehut as #link("https://drewdevault.com/2019/03/04/sourcehut-design.html")[brutalist] and I would have to agree. The pages have
minimal UX chrome, use colour sparingly, and don't have many interactive
elements, yet all the necessary information is still conveyed. For example,
while GitHub and GitLab rely heavily on iconography and hover-text, sourcehut
uses icons sparingly, and shows explanatory text inline, rather than behind a
mouse hover. This makes sourcehut more user-friendly and more accessible than
most of its competitors. While it may not look as pretty in marketing materials,
the minimalism of the sourcehut interface makes it very user-friendly.

In addition to being visually simple, the sourcehut interface is _extremely_
lightweight and most pages have no JavaScript dependency. This means that page
load latency is determined primarily by network conditions rather than by
JavaScript interpretation and DOM manipulation latency. This is in stark
contrast to GitHub and GitLab which both use extensive JavaScript (they are
basically single-page web applications). Sourcehut also uses proper form posts
and lets the browser handle navigation via hyperlinks rather than hijacking the
link functionality with JavaScript as both GitHub and GitLab do.

Another reason sourcehut is able to be so lightweight is because it uses modern
semantic HTML tags such as `<details>` to enable interactive functionality
without relying on JavaScript. This reduces the load on the JavaScript
interpreter as well as on the rendering engine because the renderer can use
optimized native code for rendering the elements rather than relying on
JavaScript to perform DOM manipulation.

For these reasons (and many more), sourcehut's interface is (and feels) much
more performant than those of GitHub and GitLab.



== Sourcehut's CI/CD Service is Fast, Powerful, and Flexible <posts-technology-migrating-to-sourcehut-sourcehuts-cicd-service-is-fast-powerful-and-flexible>

One of my main apprehensions when leaving GitLab was leaving behind the GitLab
CI/CD system. While I still think that GitLab CI/CD is a great system (and
definitely more powerful and flexible than GitHub Actions), it has many
performance issues. The UI is slow and the warmup overhead for CI jobs is even
slower.

Sourcehut's build system has a much faster warmup time and the UI (as already
discussed) is much more responsive. I'm not sure why the warmup overhead is so
much lower with sourcehut (both sourcehut and GitLab use Docker), but it's a
welcome improvement. The time between build steps is also much lower on
sourcehut builds because all the build steps are performed on the same image
(rather than in separate containers as is the case with GitLab). This also means
that short build steps are reasonable because you do not incur any of the Docker
warmup overhead between build steps.



The way that you manage secrets in sourcehut builds is also great. Unlike
GitLab, sourcehut's build secret system is file-based. The secret files get
added directly into the filesystem at the path you specify and with the UNIX
file permissions you specify. It also has special handling for SSH and PGP keys
(useful for repository mirroring, for example).

While GitLab allows you to use arbitrary Docker images to perform builds,
sourcehut provides only a #link("https://man.sr.ht/builds.sr.ht/compatibility.md")[few operating system images]. This
is both good and bad. If you use any of the provided systems for your build,
the build images are set up exactly how you probably want them. For example, the
Arch Linux image automatically allows installation of packages via the Arch User
Repository (AUR). If you are not using one of the provided systems, or otherwise
have strange build requirements, you may have a harder time.

At this point I still use GitLab CI/CD over sourcehut's build system for highly
complex CI/CD pipelines and performing builds in strange device configurations
(Windows builds, for example). However, for simple builds (such as the one for
this website), sourcehut builds is more than sufficient.

== Conclusion <posts-technology-migrating-to-sourcehut-conclusion>

I've presented a few of the primary reasons I switched to sourcehut, but there
are many more compelling features that may convince you to switch. For example:

- mailing lists are #link("https://sourcehut.org/blog/2020-07-14-setting-up-ci-for-mailing-lists/")[integrated with the sourcehut build system] and
  have a nice patch interface,
- the no-frills ticket tracking system can be used over email,
- the hosted wikis are git-backed and markdown powered,
- and much more.

What do you think? Are you ready to give sourcehut a try? If so, head on over to
https://sr.ht and sign up! Did I forget to mention a feature of sourcehut that
you find super useful? Is there a feature that sourcehut is missing that is
essential to your workflow, or is there something else that I'm missing? Start a
discussion in the comments below!
