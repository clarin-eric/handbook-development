# Meta guidelines

This section presents some guidelines for the writing and maintenance
of this handbook.

## Scope

The development handbook is aimed to give guidelines and best practices for the
development process. Strictly operational matters should be avoided
here, and rather be included in the [operational handbook](https://clarin-eric.github.io/handbook-operations/).

As a rule of thumb, the following distinction can be kept in mind:

* 👉 Anything that (also) happens on your **local machine** `SHOULD` be done in
  line with the development handbook.
* 👉 Anything that (also) happens in the **infrastructure** (in a broad sense?),
  or where **roles & responsibilities** come into play,
  `SHOULD` be done according to the operational handbook.

Note that most processes involve both development and operational aspects.

## Structure

* 👉 Each page `MUST` have a level 1 heading (`#`) for the title of the section
  or chapter
* 👉 Level 2 headings (`##`) `MUST` be used for the main sections and use lower
  level headings for subsections
* 👉 Each page `SHOULD` include a short introduction describing its scope and context

## Style

* 👉 Mark concrete guidelines with the 👉 emoji
* {TODO: Marking of policies, hints?}
* 👉 Sets of related guidelines `SHOULD` be enumerated using **unordered lists**
  (as used here)
* 👉 Important keywords `MAY` be highlighted using `**` emphasis markup
* 👉 Use `MAY`, `SHOULD` and `MUST` and use code markup for these using backticks
* 👉 References `SHOULD` be placed in footnotes. Use the footnote markup that is
  supported in both GitHub and mkdocs via the footnotes plugin, and requires usage
  of a specific syntax[^FOOTNOTES].
* 👉 Links that are not references `MAY` be rendered as regular inline links (see
  below for an example)
* 👉 The markdown for each page `MUST` pass linting with
  [markdownlint](https://github.com/markdownlint/markdownlint) (see rules[^RULES]).
   * TODO: hint about CI and local linting

## Content

* 👉 References to information sources and other relevant related resources `SHOULD`
  be included where applicable. Use footnotes as described above.

[^FOOTNOTES]: [GitHub blog: "Footnotes now supported in Markdown fields"](https://github.blog/changelog/2021-09-30-footnotes-now-supported-in-markdown-fields/)
[^RULES]: [Markdownlint repository: `docs/RULES.md`](https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md)
