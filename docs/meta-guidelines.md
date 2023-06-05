# Meta guidelines

This section presents some guidelines for the writing and maintenance
of this handbook.

## Structure

* Make a level 1 heading (`#`) for the title of the section or chapter
* Use level 2 headings (`##`) for the main sections and use lower level headings
  for subsections

## Style

* Use `MAY`, `SHOULD` and `MUST` and use code markup for these using backticks
* Mark concrete guidelines with the 👉 emoji
* Make sure that the markdown passes a linting with
  [markdownlint](https://github.com/markdownlint/markdownlint) (see
  [rules](https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md)).
* Place references in footnotes. Use the footnote markup that is supported
  in both GitHub and mkdocs via the footnotes plugin, and is described with
  examples on [this page](https://github.blog/changelog/2021-09-30-footnotes-now-supported-in-markdown-fields/).

## Content

* The handbook is aimed to give guidelines and best practices for the
  development process. Strictly operational matters should be avoided
  here, and rather bes included in the [operational handbook](https://clarin-eric.github.io/handbook-operations/).
    * As a rule of thumb, the following distinction can be kept in mind:
      Anything that (also) happens on your **local machine** `SHOULD` be done in
      line with the development handbook.
      Anything that (also) happens in the **infrastructure** (in a broad sense?),
      and where **roles & responsibilities** come into play,
      `SHOULD` be done according to the operational handbook.
      Note that many or even most processes involve both development and
      operational aspects.

* Include references to sources and relevant related resources. Use
  footnotes as described above.
