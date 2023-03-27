# General

Automation of tasks, either locally or on our servers, should be implemented in [Bash](https://www.gnu.org/software/bash/) if possible.

Any shell script should always be written in bash, using the following shebang:
```
#!/usr/bin/env bash
```

Any task that has to be done more than once is a good candidate to automate with a shell script.

Advantages:
* supported on most *-nixes and OSX.
* many developers and sysops are familiar with Bash:
  * and thus standardizing on bash lowers the learning curve.
  * and thus improving shareability.
  * and thus improving the distributability over multiple people (i.e. reducing the truck number).

Disadvantages:
* Can become long and complex and thus harder to maintain.

We leave it up to the developer / sysop to judge if and when a script becomes too long and too difficult to maintain. If implementing in Bash is not possible or considered not suitable
it is possible to implement the task in a different language, preferably resulting an excutable binary.

## Code style

Scripts should be linted via the [shellcheck](https://www.shellcheck.net/) utility. Hints should be considered, however we should be pragmatic
and if needed a specific hint can be ignored.

Google has a nice style guide regarding shell scripts, it is available [here](https://google.github.io/styleguide/shellguide.html).

Some important highlights from this guide:
* Always use .sh or .bash extension for shell scripts.
* Always add comment header below shebang with summary of script functionality.
* Line break before pipeline.
* Quote variables as `"${foo}"` instead of `$foo` abd commands as `$(foo)` instead of `foo`.
* Avoid `eval`.
* `main` function for scripts longer than a few lines and/or other functions and call it in the very end(i.e. last line) of the script, passing all parameters: `main "$@"`.
* Calling scripts: use `bash script.sh` or `./script.sh` (not `sh script.sh`).

Working directory assumptions:
* Do not make unnecessary assumptions about the current working directory, particularly when callin other scripts. If the working directory is important, specifically test for it and exit with a warning if there is any issue.
* Never change the working directory, instead do work that required another directoty in a subshell only:
  * Use round brackets to do work in a subshell: `( work )`.

Checking if a variable is set:
* Just testing `-z ${var}` doesn’t fail for the empty string `""`. Instead use:
```
if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
```
as described in more detail in [this](https://stackoverflow.com/a/13864829) stackoverflow discussion.

## Documentation
<!--
Describe how to use comments and what to comment
-->
Type we provide a comment directly after the shebang describing the purpose of the script on a high level.


## Build tools & Continuous Integration

When using the [CLARIN build image](https://gitlab.com/CLARIN-ERIC/build-image), shellcheck linting can be enabled on [gitlab.com](https://gitlab.com) as follows:
```
variables:
    GIT_SUBMODULE_STRATEGY: recursive
    DOCKER_DRIVER: overlay2
    DOCKER_HOST: tcp://docker:2376
    DOCKER_TLS_CERTDIR: "/certs"
    DOCKER_TLS_VERIFY: 1
    DOCKER_CERT_PATH: "$DOCKER_TLS_CERTDIR/client"

image: registry.gitlab.com/clarin-eric/build-image:1.3.4
services:
- name: docker:20.10.21-dind
...
stages:
- lint
...
shell-check:
    stage: lint
    script: timeout 1440 bash -x ./build.sh --lint-shell
...
```

## Testing tools
While advocating unit testing in general, we typically don't run unit tests for bash. A solution that has been mentioned is [bash unit](https://github.com/pgrange/bash_unit), however
we don't have experience with this tool.

## Static code analysis
Scripts analysis is achieved by linting via the [shellcheck](https://www.shellcheck.net/) utility.
