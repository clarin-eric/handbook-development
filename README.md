**Read the docs at [clarin-eric.github.io/handbook-development](https://clarin-eric.github.io/handbook-development/)**

# Sources for the CLARIN ERIC Software Development Guidelines

[![Publication to GitHub Pages](https://github.com/clarin-eric/handbook-development/actions/workflows/publish.yml/badge.svg)](https://github.com/clarin-eric/handbook-development/actions/workflows/publish.yml)

This repository provides the content and configurations for the CLARIN ERIC Software
Development Guidelines.

This is currently work in progress.

## Contributing

Do **not** modify the `gh-pages` branch directly!

### Introducing a new section

* Make a feature branch on this repository or a fork
* If it does not yet exist, create a new markdown file for your section and
  create the content (if necessary, also create the necessary folder structure)
* Make the necessary changes to the table of contents and/or
  [navigation configuration](./mkdocs.yml)
* `Optional but recommended`: Make a pull request, and set it to draft mode.
  Find at least one reviewer and assign them to the PR. Use Slack or face to
  face discussion to get confirmation.
* Add a link to the PR (or branch if there is no PR (yet)) to the source document

### Make or request changes to an existing section

* Edit the section that you want to work on in a fork or separate branch.
* When done, create a pull request. If you are the 'owner' of the section, find
  a reviewer and assign them. If not, assign the owner as the reviewer.

You may also create an issue and assign it to the owner of the relevant section.

## Building and deploying

Build and deploy via [MkDocs](https://www.mkdocs.org), using
[Material for MkDocs](https://github.com/squidfunk/mkdocs-material).

Initial project setup via `setup.sh` (requires docker).

### Local

Run the following to start a local server (requires docker):

`bash serve.sh 8777`

Then go to [http://localhost:8777](http://localhost:8777) to browse the documentation
based on your local source.

Alternatively install `mkdocs` and `mkdocs-material` via pip and run
`mkdocs serve` directly.

### Deployment to GitHub pages

Changes pushed to the `main` branch will automatically be deployed to
[GitHub pages](https://clarin-eric.github.io/handbook-development) using the
[mkdocs-deploy-gh-pages action](https://github.com/mhausenblas/mkdocs-deploy-gh-pages).

See the [publication workflow](./.github/workflows/publish.yml) for details.
