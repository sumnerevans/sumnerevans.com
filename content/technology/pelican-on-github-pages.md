Title: Setting up Pelican to Automatically Deploy to GitHub Pages
Date: 2017-09-11 09:02
Author: Sumner Evans
Category: Technology
Tags: Pelican, Travis CI, GitHub, GitHub Pages
Slug: 2017-09-11-pelican-auto-deploy-github-pages
Status: published

I recently converted my site from WordPress to a statically generated
[Pelican](https://blog.getpelican.com/) site hosted on GitHub Pages. One of the
most difficult parts of the transition was setting it up to automatically deploy
to GitHub Pages. In this article, I will describe how I set this up.

# Overview
I am hosting the source code for my website publicly on GitHub at
[github.com/sumnerevans/sumnerevans.github.io](https://github.com/sumnerevans/sumnerevans.github.io)
on the `source` branch. I am then using Travis CI to build my site on every push
to `source` and automatically deploy it to the `master` branch of my
`sumnerevans.github.io` repository.

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

Later on, we will be setting up Travis CI to use [GitHub Pages
Deployment](https://docs.travis-ci.com/user/deployment/pages/). You will need to
create a [Personal Access
Token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
with `public_repo` access for this. Go ahead and create it now and save the
token for use in the "Set up Travis CI" step.

# Setting up Pelican
Now you need to add all of your Pelican source code to the `source` branch and
commit it. If you used the `pelican-quickstart` command to create your site, you
should have a `Makefile`. If not, you can look at the one for this site:
[`sumnerevans.github.com/Makefile`](https://github.com/sumnerevans/sumnerevans.github.io/blob/source/Makefile).

Ensure that the `Makefile` has a `publish` (or similar) command which outputs
the built site to an output directory.

Also, if you do not already have a `requirements.txt` file in the root of your
repository, add one with the following content:

    pelican
    Markdown
    beautifulsoup4

# Setting up Travis CI
If you have not already done so, sign up for Travis CI using your GitHub account
at [travis-ci.org](https://travis-ci.org/) (it's free for Open Source projects,
so if you've made your site source code public, it will be free.)

Once you're signed in to Travis CI, and all of your GitHub repositories have
been synchronised, go to your Travis CI profile page and enable your GitHub
Pages repository.

![enable Travis on site](images/technology/travis-site-enable.png)

Now, go to the Travis CI settings for your repository and enable "Build only
if .travis.yml is present" and "Build on branch updates".

Down in the Environment Variables, add an environment variable with name
`GITHUB_TOKEN` and value of the Personal Access Token that you generated
earlier. Make sure that you have "Display value in build log" disabled.

![change environment variables](images/technology/travis-env-var.png)

Now you need to configure Travis CI. To do this, create a `.travis.yml` file in
the root of your repository and add the following to it:

```yaml
language: python
python:
- 3.6
cache: pip
install:
- pip install --upgrade pip
- pip install -r requirements.txt
script:
- make publish
deploy:
  provider: pages
  skip_cleanup: true
  github_token: $GITHUB_TOKEN
  local_dir: output
  target_branch: master
  on:
    branch: source
```

# Conclusion
You should now have a Pelican site that automatically deploys to GitHub Pages!
Go ahead and edit or create a post to test it out.
