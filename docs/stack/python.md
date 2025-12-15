# Python

## General

[PEP](https://www.python.org/dev/peps/) is a set of Python community guidelines that is a baseline for our guidelines. If you adhere to explicit PEP you can't go wrong, however as it is possible for PEPs to clash with one other we explicitly state preferred standards further. Note, that in the following sections `Python` refers explicitly to `Python3`. `Python2` reached EOL on 1.01.2020. At CLARIN-ERIC we do not operate any legacy `Python2` software and no new developments will take place, therefor we omit it in this chapter.

### Scope of guidelines applicability

Automation of tasks can be conducted using Python, but we highly recommend using Bash as a default scripting language. However, it may be beneficial to use Python in certain applications, e.g. educational content, data manipulation, data visualisation, etc., where the outcome is knowledge not software. We do not impose any explicit requirements and guidelines on Python for non-software code. It is up to the programmer to wage pros and cons of automation using Python in a given context, to be aware of target group and adjust programming practices to the context in which they are applied. Following these guidelines is a `MUST` only for software meant for deployment in production.

### Environment

* 👉 `MUST` use latest Python supported by all other dependencies.
* 👉 `MUST NOT` use your default Python distribution for development environment if your OS comes with one as it can brake system packages dependent on Python.
* 👉 `MUST NOT` override your default OS Python.
* 👉 `MUST NOT` alter your default `python/python3`
* 👉 `MUST` use virtual environment manager. Recommended lightweight core [Venv](https://docs.python.org/3/library/venv.html) or [Anaconda](https://www.anaconda.com/).

### Code style

* 👉 `MUST` enforce consistent design choices within each self-standing software/package
* 👉 `MUST` follow [PEP8](https://peps.python.org/pep-0008/) guidelines on code styling
* 👉 `MUST` strive for highest possible static type hint coverage whenever reasonably possible [PEP484](https://peps.python.org/pep-0484/)
* &emsp;(if framework documentation doesn't expose the types or uses `x: Any` you are excused)
* 👉 `MUST` strive for highest possible duck type hint coverage [PEP544](https://peps.python.org/pep-0544/)
* &emsp;(if framework documentation doesn't expose the protocols or uses `x: Any` you are excused)
* 👉 `MUST` follow minimal docstring conventions [PEP257](https://peps.python.org/pep-0257/)
* 👉 `SHOULD` use [Sphinx](https://sphinx-rtd-tutorial.readthedocs.io/en/latest/docstrings.html) docstring syntax. Any other well-defined convention is acceptable, but Sphinx is preferred. Remember to maintain consistant conventions within self-contained packages.

## Frameworks & libraries

List of recommended packages for specific applications.

### Django

We currently use [Django](https://docs.djangoproject.com/) for MVC apps. Always strive for latest LTS Django support.

### Django REST framework

We currently use [Django-rest-framework](https://www.django-rest-framework.org/) for REST API implementation. Other non-Django solutions like Flask are also fine, but we have no experience in working with any of them. Developers are free to explore other options.

### XML processing

For `XML` files processing `SHOULD` use [lxml](https://lxml.de/).

### Logging

By default, `SHOULD` use Python's core [logging](https://docs.python.org/3/library/logging.html) package. Django logging utilises core Python logging making it fully compatible.

## Building and deployment

### Build

Use `pip` as default package manage:

* 👉 `MUST` build wheels and install package from the wheel [PEP427](https://peps.python.org/pep-0427/).
* 👉 `MUST` use [pytoml](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) + `SHOULD` use [Poetry](https://python-poetry.org/docs/pyproject/) as SCM backend
* 👉 `MUST` distribute packages as wheels
* 👉 `MUST` use CLARIN's [wheel builder](https://gitlab.com/CLARIN-ERIC/docker-alpine-wheeler) for building wheels

## Testing

* 👉 Yes 🗿
* 👉 The more tests the better.
* 👉 Strive for full unit test coverage

### Testing tools

List of recommended testing tools

#### Unittests

* [Python's core unittest](https://docs.python.org/3/library/unittest.html)
* [Django's unittest extension](https://docs.djangoproject.com/en/4.2/topics/testing/overview/)
* [Django-rest-framework unittest extension](https://www.django-rest-framework.org/api-guide/testing/)

#### TODO selenium and integration testing

## Common beginner's mistakes

* 👉 `MUST NOT` use mutable default parameters values in functions, unless having a very good reason to do so. (explicitly and exhaustively document its usage with rationale for such design choice):

```Python
"""
Default parameter value is evaluated on function definition,
each call to function mutating the parameter will mutate the default value.

Read more: https://docs.python-guide.org/writing/gotchas/.
"""

# DO
def (param: List = None):
    param = []
    pass

# DO NOT
def (param: List = []):
    pass
```
