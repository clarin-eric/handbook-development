# Code lifecycle

{TODO: introduction}

## Releasing

### Release stages

- **Alpha**: Feature developments
	- Dependencies can still change, including updates to new minor versions
- **Beta**: Feature freeze
	- Bug fixes and feature enhancements
	- Dependency checks, update to latest within minor
- **Release candidate**
	- Bugs must be fixed or documented as known issues
	- Final dependency checks, main focus on security (high and critical
	vulnerabilities must be resolved or else documented)
	- Write or finalise a change log and upgrade instructions
- **Release**
	- Should be identical to the last release candidate except for the 
	version number

### Publication

👉 Make a GitHub or GitLab release for each stable tag. 
- Specify any major changes in this version
- If it is a maintenance release, write 'Maintenance release'
- List major vulnerabilities resolved
- For images: specify the version of base image os and relevant software packages
(also if not changed)
- For 'base images': include the relevant platform versions in the title of the
release (e.g. `3.18.4 / Java 17.0.9`)



## Version numbering

-   Version numbering

-   Scope

-   Service or application components are versioned separately?

-   Independent version numbering for

-   Projects that are released separately

-   Projects that are version controlled separately (multi-repo)

-   Synchronised version numbers acceptable only for

-   projects that are maintained in the same repository (mono-repo)

-   For libraries

-   Semantic versioning -> <https://semver.org/>

-   Published APIs

-   See [Versioning](https://docs.google.com/document/d/1xnh13Xo1Lrn8KHNAj7NP4yjMIw4xk64Pq7ClQf-XuSs/edit#heading=h.p1c1zaeupud0)

-   No tight coupling between specification version and implementation version

-   Note: one service can implement multiple (versions of) specifications

-   For applications

-   Major

-   Increase for major revisions affecting all or most features, or user interface

-   Increase when significant features changed fundamentally( or removed)?

-   Minor

-   Increase for new feature(s)

-   Increase for major dependency upgrades??

-   Patch

-   Increase for bug fixes and small improvements to existing features

-   Increase for minor dependency upgrades

-   Alpha and beta releases, release candidates

-   Feature freeze from beta on

-   Keep version number (x.y.z) persistent from alpha to release

-   The final release should be identical (same revision) to the last release candidate

-   Versioning docker images

-   Single application centered images

-   Strategy: ${APP_VERSION}-${N}

-   Where N is an integer that is incremented with each release.

-   Could alternatively include a qualifier such as 'test'??

-   Image version (increment) resets for every app version, so there can be 1.0.0-1 ; 1.0.0-2; 1.1.0-1

-   Examples:

|

App v.

 |\
 |

Image v.

 |

Combined

 |
|

1.0.0

 |

_

 |

1.0.0

 |

app-1.0.0_1.0.0

 |
|

1.1.0-alpha1

 |

_

 |

1.0.0

 |

app-1.1.0-alpha1_1.0.0

***or****:*

*app-1.1.0_1.0.0*

 |
|

1.1.0-beta2

 |

_

 |

1.0.0-test1

 |

app-1.1.0-beta2_1.0.0-test1

***or****:*

*app-1.1.0_1.0.0-test1*

 |

-   'Environment providing' images (e.g. alpine, java, tomcat base images)

-   Independent version numbering

-   For compose projects

-   Alignment with application like for docker image IFF there is a single application with a single version number it is built around

-   Otherwise use independent version numbering (suite version)

-   Take care of naming ('suite' should ideally have its own name)

-   Usage of commit id (git hash)

-   Do NOT use in version number

-   Good practice to include it somewhere in the built application (about page or manifest)


## Branching, merging strategies

-   General guidelines on workflow(s)

-   Default choice: Git Flow

-   Stages (active development/out of development/deprecated)

-   Projects that go 'out of development' can have their **development branch dropped**; in this stage, only make hotfixes.

-   Hotfix should be in hotfix branch (not directly to main)

-   Branches

-   The main branch

-   = Stable

-   Should have tests and checks in successful state (or warning, no fail)

-   Avoid direct commits to main branch

-   Use GH/GL repo config to protect main branch

-   Name: use 'main' for new projects - ok but not necessary to rename in existing projects

-   Configure your local git client to use 'main' as the default branch when initializing new repositories:\
    *git config --global init.defaultBranch main*\
    ([source](https://github.blog/2020-07-27-highlights-from-git-2-28/#introducing-init-defaultbranch))

-   Development branch(es)

-   Name: ^dev(elop(ment)?)?$

-   "Permanent" development branch?

-   Keep ahead of main branch! With merge.

-   Alpha tags/release can be made from this branch

-   Feature branches

-   Naming

-   Good practice to include issue number(s) if applicable

-   Otherwise as descriptive (but short) as possible

-   Should branch off directly from the development branch. Do not 'stack'

-   Rebase and clean up before merging back into the targeted branch

-   Don't force push the feature branch unless it is a private one

-   Alpha tags/release can be made from this branch

-   Release branches

-   Name

-   release-x.y(.z)

-   Upon feature freeze

-   Version number in code base changes on this branch (not develop)

-   From here you may tag *x.y.z-betaN* (also alpha)

-   Bug fixes until ready for x.y.z release

-   Merge into main branch at time of x.y.z release, then tag *x.y.z* on main branch

-   Tags

-   Avoid deleting tags

-   Exception can be to try to avoid usage anywhere

-   Exception can be to immediately clean up after a slip-up

-   In case of image to be removed from container repo

-   Delete the image from the container repo but keep the tag, adding a description to the release

-   NEVER remove a tag if there has ever been a deployment based on that tag (whether testing, staging or production)

-   Re-tagging

-   Do not re-tag (use same tag name twice) UNLESS

-   In a private repository

-   Know for sure that it can not have been used anywhere

-   Never for stable (non alpha, beta or RC)

-   Examples of tag patterns for application (note: this repeats on the right hand side for docker images, see section X)

-   Towards release `x.y.z`, normally in this order

-   alpha release(s): `x.y.z-alphaN`

-   [feature freeze]

-   beta release(s): `x.y.z-betaN`

-   release candidates: `x.y.z-rcN`

-   final release: `x.y.z`

-   Pull requests / merge requests (PRs)

-   Good practice to use PRs instead of merging directly in the client, especially if multiple people are actively working on a project

-   Make pull requests on feature branches (& release branches)

-   preferably pull requests are not made on permanent branches

-   note: if your branching strategy includes permanent branches other than the main branch (e.g. development), it probably fits to make release branch

-   Naming: PR name should describe the change and if applicable a reference to the issue #

-   in case of feature branches the name of the branch might give this information

-   beware of default behaviour of Git(Hub|Lab) to use last commit message as title

-   PR acceptance

-   Tests & checks should all pass

-   If overriding failed checks, document reason in a comment

-   Code reviews?

-   See below

-   Recommended to request review for PR if multiple active contributors

-   Branch specific requirements

-   Forks

-   If the sausage making is very ugly, consider doing it in a fork

-   Examples:

-   work that is likely to require a lot of rewriting of git history

-   testing

-   experimenting with tags, CI pipeline

-   Branch in fork with same name as upstream can serve as feature branch - PR must clearly describe the feature

-   Maintaining multiple versions

-   Keep a permanent branch for older versions that need to be maintained

-   If need be such a branch can be created at any stage

-   Avoid 'orphaned' tags

## Code reviews

....

## Continuous integration

-   Where?

-   GitLab

-   Docker builds -> deploy to GitLab (repo) docker registry

-   Docker compose (test stage tested on GitLab; performance benefit of loading of images from registry)

-   Building of GitHub projects on GitLab for full chain Maven -> Image build & deploy to registry

-   Pay attention to artifact size limits

-   GitHub actions

-   For application code

-   Can be used to trigger build on GitLab

-   (Theoretically) more portable than Travis

-   Travis

-   Guideline: transition to GitHub actions if feasible

Recommended to have all the following stages implemented:

Stages

-   Linting / resource validation

-   Docker files

-   Shell scripts

-   JS

-   CSS

-   XML

-   Python??

-   Compiling / building

-   Testing

-   Application code: unit tests

-   Docker: build script test command (compose based)

-   Docker compose: control script test command

-   Security check/scan

-   Docker (compose): snyk

-   Release

-   Application: deploy artifact to GitHub release

-   Docker: deploy multi-architecture image to repository

Ignoring or skipping (failing) tests:

-   During development

-   In case of upstream issues that cannot be resolved