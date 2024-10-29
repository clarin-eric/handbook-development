# Code lifecycle

{TODO: introduction}

## Version numbering

👉 The format that version numbers `SHOULD` adhere to is `major.minor.patch[-qualifier]`
where:

- `major`, `minor` and `patch` `SHOULD` be integers, and
- the optional `qualifier`, if included, `SHOULD` be either `test`, `alpha`,
  `beta` or `RC`, followed by an integer, OR a string such as `dev`, `SNAPSHOT`
  [in case of work in progress].

Examples:

- Examples of valid version numbers *without qualifiers*: `1.0.0`, `4.11.2`
- Examples of valid version numbers *with qualifiers*: `3.0.1-alpha1`, `8.6.0-RC2`,
  `2.5.0-SNAPSHOT`
- Examples of *invalid version numbers*: `1.0`, `2-alpha1`, `3.1.0-beta`

👉 Commit id (git hash) `SHOULD NOT` be used in the version number. It is good
practice is to include it somewhere in the built application ("About" page and/or
manifest file).

### Scope

👉 Version numbers `SHOULD` be *aligned* for projects that are maintained in the
same repository and share a release pipeline (e.g. modules of an application)

👉 Version numbers `SHOULD` be *decoupled* for projects that are released separately
and/or are maintained in separate repositories.

### Increasing version numbers

👉 When releasing a new version of a software component or other project,
_one_ of the version components `SHOULD` be increased (major, minor, patch
or qualifier), typically by `+1`.

👉 Semantic versioning `SHOULD` be applied in the case of libraries and shared APIs
as described at [semver.org](https://semver.org). More on versioning of APIs
in the [API section of the handbook](api.md).

Regarding version number increases, the following guidelines are to be considered:

- 👉 The *major* version number `SHOULD` be increased
   - for major revisions affecting all or most features, or most of the
     user interface;
   - if significant features changed or reimplemented fundamentally,
     or removed;
   - if compatibility with existing configurations is broken;
   - if public access paths (i.e. URLs) have changed in an incompatible way.
- 👉 The *minor* version number `SHOULD` be increased
   - when new features have been added;
   - when the underlying framework or other core dependencies have had a major
  version upgrade.
- 👉 The *patch* level version number `SHOULD` be increased
   - for bug fixes and small improvements to existing features;
   - for minor dependency upgrades;
   - for any other kind of maintenance that does not affect functionality or
     compatibility.
- 👉 The *qualifier* can be increased at any point during alpha, beta and release
  candidate development stages. For stable releases, it must be excluded altogether.

## Releasing

### Lifecycle stages

👉 The release process `SHOULD` be broken up into the following stages.
Promote (or demote) according to the descriptions below. The version number
(and therefore tag) `SHOULD` reflect the lifecycle stage in the value and/or
presence of the qualifier part of the version number.

- **Alpha**: Feature developments
   - Stability and functionality do not have to be guaranteed
   - Dependencies can still change, including updates to new minor versions
   - Alpha status should be clear to the end user in the application's
     interface (if applicable)
- **Beta**: Feature freeze
   - Bug fixes and feature enhancements
   - Dependency checks, update to latest within minor and apply any
     available security updates
   - Version control: branch off from development
   - Beta status should be clear to the end user in the application's
     interface (if applicable)
- **Release candidate**
   - Bugs are either fixed or documented as known issues
   - Final dependency checks, main focus on security (high and critical
     vulnerabilities must be resolved or else documented)
   - Write or finalise a change log and upgrade instructions
- **Release**
   - Should be identical to the last release candidate except for the
     version number

### Hotfixes

{TODO}

### Publication

👉 Make a GitHub or GitLab release for each stable tag.

- Specify any major changes in this version
- If it is a maintenance release, write 'Maintenance release'
- List major vulnerabilities resolved
- For images: specify the version of base image os and relevant software packages
  (also if not changed)
- For 'base images': include the relevant platform versions in the title of the
  release (e.g. `3.18.4 / Java 17.0.9`)

### Docker image versioning

👉  The following approach `SHOULD` be followed for *application images* and
`MAY` be followed for other images that are centred around a specific version of
a platform or environment:

- Scheme for the version number/tag is `{APP_VERSION}_{X.Y.Z}`  
   - Where `{X.Y.Z}` is a version that follows the guidlines above and starts with
     `1.0.0` for each new value of `{APP_VERSION}`
   - `{APP_VERSION}` `MAY` include qualifiers such as `alpha1`, but `{X.Y.Z}`
     `SHOULD` consist of three dot separated digits only
   - `{APP_VERSION}` `MAY` be reduced to a significant level such as `{major.minor}`
     or in some cases even just `{major}`
   - Resetting of the image version resets for every app version, so there will be,
     for instance, `1.0_1.0.0`, followed by `1.0_2.0.0` and `1.1_1.0.0`.
   - Examples:

| App v.       |   | Image v. | Combined               |
|--------------|---|----------|------------------------|
| 1.0.0        | _ | 1.0.0    | app-1.0.0_1.0.0        |
| 1.1.0-alpha1 | _ | 1.2.2    | app-1.1.0-alpha1_1.2.2 |

👉 For *base images* and other images that provide a platform or 'environment'
rather than an application (e.g. alpine, java, tomcat, nginx), version numbering
`MAY` follow the same scheme as applications (`major.minor.path[-qualifier]`).

### Docker compose projects

👉 The following approach `SHOULD` be followed for compose projects:

- IFF there is a single application with a single version number it is built
  around, follow the same scheme as for application docker images (`{APP_VERSION}_{X.Y.Z}`)
- Otherwise use 'independent' version numbering (suite version)
- Naming of the project typically reflects whether it is application centered or
  a 'suite'. In the latter case it has (or could have) a name that is different to
  one of the included services.

## Branching, merging strategies

- General guidelines on workflow(s)

   - Default choice: Git Flow
   - Stages (active development/out of development/deprecated)
      - Projects that go ‘out of development’ can have their **development branch dropped**; in this stage, only make hotfixes.
         - Hotfix should be in hotfix branch (not directly to main)
- Branches
   - The main branch
      - \= Stable
         - Should have tests and checks in successful state (or warning, no fail)
      - Avoid direct commits to main branch
         - Use GH/GL repo config to protect main branch
      - Name: use ‘main’ for new projects - ok but not necessary to rename in existing projects
         - Configure your local git client to use ‘main’ as the default branch when initializing new repositories:
              git config --global init.defaultBranch main
            ([source](https://github.blog/2020-07-27-highlights-from-git-2-28/#introducing-init-defaultbranch))

   - Development branch(es)
      - Name: ^dev(elop(ment)?)?$
      - “Permanent” development branch?
         - Keep ahead of main branch! With merge.
      - Alpha tags/release can be made from this branch
   - Feature branches
      - Naming
         - Good practice to include issue number(s) if applicable
         - Otherwise as descriptive (but short) as possible
      - Should branch off directly from the development branch. Do not ‘stack’
      - Rebase and clean up before merging back into the targeted branch
         - Don’t force push the feature branch unless it is a private one
      - Alpha tags/release can be made from this branch
   - Release branches
      - Name
         - release-x.y(.z)
      - Upon feature freeze
      - Version number in code base changes on this branch (not develop)
      - From here you may tag x.y.z-betaN (also alpha)
      - Bug fixes until ready for x.y.z release
      - Merge into main branch at time of x.y.z release, then tag x.y.z on main branch
- Tags
   - Avoid deleting tags
      - Exception can be to try to avoid usage anywhere
      - Exception can be to immediately clean up after a slip-up
      - In case of image to be removed from container repo
         - Delete the image from the container repo but keep the tag, adding a description to the release
      - NEVER remove a tag if there has ever been a deployment based on that tag (whether testing, staging or production)
   - Re-tagging
      - Do not re-tag (use same tag name twice) UNLESS
         - In a private repository
         - Know for sure that it can not have been used anywhere
      - Never for stable (non alpha, beta or RC)
   - Examples of tag patterns for application (note: this repeats on the right hand side for  docker images, see section X)
      - Towards release \`x.y.z\`, normally in this order
         - alpha release(s): \`x.y.z-alphaN\`
         - \[feature freeze\]
         - beta release(s): \`x.y.z-betaN\`
         - release candidates: \`x.y.z-rcN\`
         - final release: \`x.y.z\`
- Pull requests / merge requests (PRs)
   - Good practice to use PRs instead of merging directly in the client, especially if multiple people are actively working on a project
   - Make pull requests on feature branches (& release branches)
      - preferably pull requests are not made on permanent branches
         - note: if your branching strategy includes permanent branches other than the main branch (e.g. development), it probably fits to make release branch
   - Naming: PR name should describe the change and if applicable a reference to the issue #
      - in case of feature branches the name of the branch might give this information
      - beware of default behaviour of Git(Hub\|Lab) to use last commit message as title
   - PR acceptance
      - Tests & checks should all pass
         - If overriding failed checks, document reason in a comment
      - Code reviews?
         - See below
         - Recommended to request review for PR if multiple active contributors
      - Branch specific requirements
- Forks
   - If the sausage making is very ugly, consider doing it in a fork
      - Examples:
         - work that is likely to require a lot of rewriting of git history
         - testing
         - experimenting with tags, CI pipeline
      - Branch in fork with same name as upstream can serve as feature branch - PR must clearly describe the feature
- Maintaining multiple versions
   - Keep a permanent branch for older versions that need to be maintained
   - If need be such a branch can be created at any stage
   - Avoid ‘orphaned’ tags

## Code reviews

....

## Continuous integration

- Where?
   - GitLab
      - Docker builds -> deploy to GitLab (repo) docker registry
      - Docker compose (test stage tested on GitLab; performance benefit of loading of images from registry)
      - Building of GitHub projects on GitLab for full chain Maven -> Image build & deploy to registry
      - Pay attention to artifact size limits
   - GitHub actions
      - For application code
      - Can be used to trigger build on GitLab
      - (Theoretically) more portable than Travis
   - Travis
      - Guideline: transition to GitHub actions if feasible
   -

Recommended to have all the following stages implemented:

Stages

- Linting / resource validation
   - Docker files
   - Shell scripts
   - JS
   - CSS
   - XML
   - Python??
- Compiling / building
- Testing
   - Application code: unit tests
   - Docker: build script test command (compose based)
   - Docker compose: control script test command
- Security check/scan
   - Docker (compose): snyk
- Release
   - Application: deploy artifact to GitHub release
   - Docker: deploy multi-architecture image to repository

Ignoring or skipping (failing) tests:

- During development
- In case of upstream issues that cannot be resolved
