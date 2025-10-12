# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Sumner Evans' personal website built with Hugo Static Site Generator. The site is deployed to GitHub Pages at https://sumnerevans.com.

## Development Environment

This project uses Nix for development environment management. Enter the development shell with:

```bash
nix develop
```

This provides all necessary dependencies including Hugo, Node.js, Vale (prose linter), and pre-commit.

## Build and Development Commands

### Local Development
```bash
# Start Hugo development server with live reload
hugo server

# Start with draft content visible
hugo server -D
```

### Building the Site
```bash
# Build the site (output to public/)
hugo --gc --minify

# Build with debug logging
hugo --logLevel debug --gc --minify
```

### Generate Search Index
After building the site, generate the search index:
```bash
node generate_index.js < public/index.json > public/search-index.json
```

### Content Linting
```bash
# Run Vale prose linter on markdown files
vale content/

# Run Vale on specific file
vale content/posts/programming/my-article.md
```

### Pre-commit Hooks
```bash
# Install pre-commit hooks
pre-commit install

# Run pre-commit checks manually
pre-commit run --all-files
```

## Content Organization

Content is organized in `content/` with the following structure:

- `content/posts/` - Blog posts organized by category:
  - `programming/` - Technical programming articles
  - `software-engineering/` - Software engineering practices and reflections
  - `technology/` - Technology reviews and tutorials
  - `travel/` - Travel logs and experiences
  - `matrix/` - Matrix protocol and ecosystem posts
  - `politics/` - Political commentary
  - `music/` - Music reviews and roundups
  - `life-updates/` - Personal life updates
  - `hackathons/` - Hackathon experiences
  - `school/` - School-related posts
  - `projects/` - Project announcements
  - `theology/` - Theological reflections
- `content/portfolio/` - Professional portfolio and resume
- `content/teaching/` - Teaching materials (includes raw HTML copied to output)
- `content/about.md` - About page
- `content/gear.md` - Gear and equipment list
- `content/now.md` - Current activities and focus

### Post Formats

Posts can be either:
1. Single markdown files (e.g., `my-post.md`)
2. Page bundles with an `index.md` and associated resources like images (e.g., `my-post/index.md`)

Use page bundles when the post includes images or other media files.

### Frontmatter

All posts require frontmatter with:
- `title` - Post title
- `date` - Publication date in RFC3339 format
- `categories` - List of categories
- `tags` - List of tags (optional)
- `math: true` - Enable if using LaTeX math (optional)

Example:
```yaml
---
title: My Post Title
date: 2025-10-11T12:00:00-06:00
categories:
  - Programming
tags:
  - Hugo
  - Nix
---
```

## Special Build Steps

The full build process (as seen in `.github/workflows/build.yaml`) includes:

1. **OpenRing** - Generates webring of other blogs:
   ```bash
   go run git.sr.ht/~sircmpwn/openring@latest \
       -S feed_urls.txt \
       -n 5 -l 100 \
     < other-feeds.html.tmpl \
     > themes/smol/layouts/partials/webring.html
   ```

2. **Hugo Build** - Compiles the site with minification

3. **Search Index** - Generates Lunr.js search index from Hugo's JSON output

4. **Teaching Materials** - Copies raw HTML teaching content to output directory

## Theme

The site uses a custom theme located at `themes/smol/`. The theme is tracked in the repository (not a submodule).

## Hugo Modules

The site uses Hugo modules for additional functionality:
- `github.com/KKKZOZ/hugo-admonitions` - Admonition/callout blocks
- `github.com/hugomods/icons/vendors/tabler` - Tabler icon set

Run `hugo mod get -u` to update modules.

## Math Rendering

Posts with `math: true` in frontmatter support LaTeX math using:
- Inline: `\(...\)`
- Block: `\[...\]` or `$$...$$`

The goldmark renderer passes these through for client-side rendering.

## Writing Guidelines

The `.vale.ini` configuration enforces writing style using:
- Custom `sumner` style rules
- Microsoft and Google style guides
- write-good and proselint for general prose quality

Vale ignores code blocks, LaTeX, and certain HTML classes.

## Git Workflow

- Main branch: `master`
- Site auto-deploys from `master` branch via GitHub Actions
- Pre-commit hooks check formatting, JSON/YAML validity, and enforce trailing newlines
