# Bash

This section presents guidelines for the writing and maintenance of bash
scripts.

## General

Automation of tasks, either locally or on our servers, should be implemented in
Bash [^BASH] if possible.

* 👉 Any shell script `SHOULD` always be written in bash, using the following
  shebang:

```bash
#!/usr/bin/env bash
```

Any task that has to be done more than once is a good candidate to automate
with a shell script.

Advantages:

* Supported on POSIX compatible OSes.
* Many developers and sysops are familiar with Bash:
   * and thus standardizing on bash lowers the learning curve.
   * and thus improving shareability.
   * and thus improving the distributability over multiple people (i.e.
     reducing the truck number).

Disadvantages:

* Can become long and complex and thus harder to maintain.

We leave it up to the developer / sysop to judge if and when a script becomes
too long and too difficult to maintain. If implementing in Bash is not
possible or considered not suitable it is possible to implement the task in
a different language, preferably resulting in an executable
binary which runs out-of-the-box without the need to install a runtime
environment.

## Dependencies

Scripts can make use of external dependencies to function properly. It is
important to be aware of any missing dependencies before executing the
scripts. Installing dependencies automatically from a script can have an impact
on other processes running in the same environment and thus should be
avoided where possible. The script should check for the availability of the
dependencies during runtime and inform the user on how to proceed in case some
dependency is missing.

The use of subshells [^SUBSHELLS] is considered a good approach to isolate the
effects of certain commands and operations.

* 👉 The script `MUST` not make any persistent changes to the environment where
  it is executed. E.g. install packages.
* 👉 If the script depends on external tools, it `SHOULD` check if these
  dependencies are available and abort execution of the script if any required
  dependency is missing.
* 👉 If any required dependency is missing the script `SHOULD` print a warning
  with a description on how to install the dependency.

## Code style

* 👉 Scripts `SHOULD` be linted via the ShellCheck [^SHELLCHECK] utility.
* 👉 Hints `SHOULD` be considered and fixed where possible, however we aim to
  be pragmatic and if needed a specific hint can be ignored.

Google has a nice style guide [^GOOGLESTYLE] regarding shell scripts.

Some important highlights from this guide:

* Always use .sh or .bash extension for shell scripts.
* Always add comment header below shebang with summary of script functionality.
* Line break before pipeline.
* Quote variables as `"${foo}"` instead of `$foo` and commands as `$(foo)`
  instead of `foo`.
* Avoid `eval`.
* Write a `main` function for scripts longer than a few lines and/or other
  functions and call it in the very end(i.e. last line) of the script, passing
  all parameters: `main "$@"`.
* Calling scripts: use `bash script.sh` or `./script.sh` (not `sh script.sh`).

Working directory assumptions:

* Do not make unnecessary assumptions about the current working directory,
  particularly when calling other scripts. If the working directory is
  important, specifically test for it and exit with a warning if there is any
  issue.
* Never change the working directory, instead do work that required another
  directory in a subshell only:
   * Use round brackets to do work in a subshell: `( work )`.

Checking if a variable is set:

* Just testing `-z ${var}` doesn’t fail for the empty string `""`. Instead use:

```bash
if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
```

as described in more detail in this [^STACKOVERFLOW] stackoverflow discussion.

## Documentation

* 👉 Typically we `SHOULD` provide a comment directly after the shebang
  describing the purpose of the script on a high level.
* 👉 Furthermore functions `SHOULD` have a short comment explaining the purpose
  of the function, the support inputs and ouputs.
* 👉 A bash script `SHOULD` always support the `-h`, `--help` parameters. When
  called with this argument the script gives a meaningful summary of its usage
  and its parameters.

## Build tools & Continuous Integration

When using the CLARIN build image [^BUILDIMAGE], ShellCheck linting can be
enabled on gitlab.com [^GITLAB] as follows:

1. Add a `lint` stage to the `stages` section.
1. Add a command `shell-check` (or any other appropriate name) to the `lint`
   stage with the script `./build.sh --lint-shell`.

Example:

```yaml
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

For github actions try this:

```yaml
name: Shell linting
on:
  push:
  pull_request:

jobs:
  lint:
    name: Lint shell
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Lint
        run: ./build.sh --lint-shell
...
```

## Testing tools

While advocating unit testing in general, we typically don't run unit tests for
bash. A solution that has been mentioned is bash unit [^BASHUNIT], however
we don't have experience with this tool.

## Static code analysis

Script analysis is achieved by linting via the ShellCheck[^SHELLCHECK] utility,
see section above "Build tools & Continuous Integration"

## Further Reading

* [^BASH] [GNY Bash website](https://www.gnu.org/software/bash/)
* [^SHELLCHECK] [Shellcheck website](https://www.shellcheck.net/)
* [^SUBSHELLS] [Advanced Bash-Scripting Guide: Chapter 21. Subshells](https://tldp.org/LDP/abs/html/subshells.html)
* [^GITLAB] [Build Image GitLab repository](https://gitlab.com/CLARIN-ERIC/build-image)
* [^BUILDIMAGE] [Deploy Script GitLab repository](https://gitlab.com/CLARIN-ERIC/deploy-script)
* [^STACKOVERFLOW]
  [Stackoverflow question: "How to check if a variable is set in Bash"](https://stackoverflow.com/a/13864829)
* [^BASHUNIT] [bash_unit GitHub repository](https://github.com/pgrange/bash_unit)
* [^GOOGLESTYLE] [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
