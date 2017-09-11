Title: Setting up Pelican to Automatically Deploy to GitHub Pages
Date: 2017-09-11 09:02
Author: Sumner Evans
Category: Technology
Tags: Pelican, Travis CI, GitHub, GitHub Pages
Slug: 2017-09-11-pelican-auto-deploy-github-pages
Status: draft

I recently converted my site from WordPress to a statically generated
[Pelican](https://blog.getpelican.com/) site hosted on GitHub Pages. One of the
most difficult parts of the transition was setting it up to automatically deploy
to GitHub Pages. In this article, I will describe how I set this up.

# Overview
I am hosting the source code for my website publicly on GitHub at
<https://github.com/sumnerevans/sumnerevans.github.io> on the `source` branch. I
am then using Travis CI to build my site on every push to `source` and
automatically deploy it to the `master` branch of my `sumnerevans.github.io`
repository.

## Prerequisites
- I assume that you have basic competency using Git and GitHub. I do not give
  you the exact Git commands to run since it can vary depending on how you plan
  to use it.
- I assume that you already have a Pelican site set up.  If you don't, the
  [Pelican Documentation](http://docs.getpelican.com/en/stable/quickstart.html)
  is really good. I recommend using the `pelican-quickstart` command to create
  your site.
- I assume that you have basic competency in Makefiles.

# Setting up GitHub
You can find up-to-date instructions on how to create a GitHub Pages site
[here](https://pages.github.com/). Once you have set up your repository, you
need to create a new branch. I called it `source` but you can name it whatever
you want (for the sake of the rest of the article, I'll assume you chose to name
it `source`). After you've created the `source` branch, push it to GitHub.

Next, go to the Settings page for your GitHub Pages repository and click on
"Branches". From the Default Branch dropdown, select "source".

![select the branch from the dropdown](images/technology/gh-pages-default-branch.png)

# Setting up Pelican
Now you need to add all of your Pelican source code to the `source` branch and
commit it. If you used the `pelican-quickstart` command to create your site, you
should have a `Makefile`. If not, you can look at the one for this site:
[`sumnerevans.github.com/Makefile`](https://github.com/sumnerevans/sumnerevans.github.io/blob/source/Makefile).

Ensure that the `Makefile` has a `publish` (or similar) command which outputs
the built site to an output directory.

# Setting up Travis CI

