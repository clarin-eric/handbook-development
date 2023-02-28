**Read the docs at [clarin-eric.github.io/handbook-development](https://clarin-eric.github.io/handbook-development/)**

# Sources for the CLARIN ERIC Software Development Guidelines
[![Publication to GitHub Pages](https://github.com/clarin-eric/handbook-development/actions/workflows/publish.yml/badge.svg)](https://github.com/clarin-eric/handbook-development/actions/workflows/publish.yml)

This repository provides the content and configurations for the CLARIN ERIC Software
Development Guidelines.

This is currently work in progress.

## Contributing

Do **not** modify the `gh-pages` branch directly!

### Make or request changes to an existing section

* Edit the section that you want to work on in a fork or separate branch. 
* When done, create a pull request. 

You may also create an issue and assign it to the owner of the relevant section.

### Introducing a new section

* Make an issue that describes the work, assign to yourself
* Make a feature branch on this repository or a fork
* Create a new markdown file for your section and create the content
* Create the necessary folder structure if necessary
* Make the necessary changes to the tabe of contents and/or 
[navigation configuration](./mkdocs.yml)
* When ready to be reviewed, create a pull request

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
