# Sumner's Website

[![Build and Deploy](https://github.com/sumnerevans/sumnerevans.com/actions/workflows/build.yaml/badge.svg)](https://github.com/sumnerevans/sumnerevans.com/actions/workflows/build.yaml)
[![Sponsor Badge](https://img.shields.io/github/sponsors/sumnerevans?logo=github)](https://github.com/sponsors/sumnerevans)

This is the source for Sumner Evans' website. The site is built using the
[Hugo Static Site Generator](https://gohugo.io/) and is live at
<https://sumnerevans.com>.

For local search, run `hugo server -D` and `npm run dev:search-index` in
separate terminals. The latter generates `static/search-index.json` from Hugo's
search data and updates it when the content changes. The production build
generates the same index after Hugo finishes.
