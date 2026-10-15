# AGENTS.md

## Repository

- This is a Hugo site. Site configuration is in `hugo.yaml`; templates are in `layouts/` and `themes/smol/layouts/`.
- Posts live in `content/posts/`. Use a page bundle (`index.md` plus resources) for a post with local media.
- The two `content/teaching/` course directories are excluded from Hugo and copied into `public/` by `.github/workflows/build.yaml`. Account for that step when changing the build or teaching content.

## Development and checks

- Enter the development environment with `nix develop`.
- Build the site with `hugo --gc --minify`.
- Run `vale content/` when editing prose and `pre-commit run --files <changed files>` for changed files. CI runs pre-commit checks.
- For local search work, follow the two-command setup in `README.md`. The production search index is generated after the Hugo build in `.github/workflows/build.yaml`.

## Commits

- Use [Scoped Commits](https://scopedcommits.com/) for all commit messages. Format normal subjects as `<scope>: <description>`, using the affected area as the scope. Follow the site's guidance for bodies, trailers, and special commits.
