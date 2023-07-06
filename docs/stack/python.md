# General 
[PEP](https://www.python.org/dev/peps/) is a set of Python community guidelines that is a baseline for our guidelines. If you adhere to explicit PEP you can't go wrong, however as it is possible for PEPs to clash with one other we explicitly state preferred standards further. Note, that in the following sections `Python` refers explicitly to `Python3`. `Python2` reached EOL on 1.01.2020. At CLARIN-ERIC we do not operate any legacy `Python2` software and no new developments will take place, therefor we ommit it in this chapter. 

## Scope of guidelines applicability 
Automation of tasks can be conducted using Python, but we highly recommend using Bash as a default scripting language. However, it may be beneficial to use Python in certain applications, e.g. educational content, data manipulation, data visualisation, etc., where the outcome is knowledge not software. We do not impose any explicit requirements and guidelines on Python for non-software code. It is up to the programmer to wage pros and cons of automation using Python in a given context, to be aware of target group and adjust programming practices to the context in which they are applied. Following guidelines apply only to the software meant for deployment in production. 

## Environment 
MUST use latest Python supported by all other dependencies. 
MUST NOT use your default Python distribution for development environment if your OS comes with one as it can brake system packages dependent on Python.
MUST NOT update your operating system’s Python installation unless the OS itself wants you to
MUST use virtual environment managers. Recommended lightweight core [Venv](https://docs.python.org/3/library/venv.html) or [Anaconda](https://www.anaconda.com/). 

## Code style 
MUST enforce constistant design choices within each self-standing software/package
MUST follow [PEP8](https://peps.python.org/pep-0008/) guidelines on code styling
MUST statically hint type [PEP484](https://peps.python.org/pep-0484/)
MUST statically duck type [PEP544](https://peps.python.org/pep-0544/)
MUST follow minimal docstring conventions [PEP257](https://peps.python.org/pep-0257/)
SHOULD use [Sphinx](https://sphinx-rtd-tutorial.readthedocs.io/en/latest/docstrings.html) docstring syntax. Any other well defined convention is acceptable, but Sphinx is preferred. Remember to maintain consistant conventions within self-contained packages. 

## TODO Python vs Cython 

# Frameworks & libraries 
List of recommended packages for specific applications.
## Django
For web applications we use [Django](https://docs.djangoproject.com/) by default. Always strive for latest LTS Django support. 

## Django REST framework 
SHOULD use [Django-rest-framework](https://www.django-rest-framework.org/) for REST API implementation. Other solutions like Flask are also fine, but we have no experience in working with any of them. Developers are free to explore other options and in future expand on this section

## XML processing 
For `.xml` files processing SHOULD use [lxml](https://lxml.de/). 

## Logging 
By default SHOULD use Python's core [logging](https://docs.python.org/3/library/logging.html) package. Django logging utilises core Python logging making it fully compatible.

# Build config & CI 
Use `pip` as default package manage:
* On Alpine [package registry](https://pkgs.alpinelinux.org/packages) has priority over PyPi (don't install/build with `pip` if `apk` available). Read more about [using Alpine can make Python Docker builds 50x slower](https://pythonspeed.com/articles/alpine-docker-python/) and [platform tag for Linux distributions using musl (PEP 656)](https://peps.python.org/pep-0656/). 
* With depreciaciation of setuptools strive for [pyproject.toml](https://pip.pypa.io/en/stable/reference/build-system/pyproject-toml/) as default SCM with [Poetry](https://python-poetry.org/) backend. (as of 04.07.2013 some of the setuptools functionalities are still in Beta for `pytoml+poetry` SCM, in case of clashes fall back for legacy setup.py)
* Build wheels and install package from the wheel [PEP427](https://peps.python.org/pep-0427/) whenever possible. Instalations from `stdist` only as last resort. 


# Testing tools
List of recommended testing tools
## Unittests
[Python's core unittest](https://docs.python.org/3/library/unittest.html)
[Django's unittest extenstion](https://docs.djangoproject.com/en/4.2/topics/testing/overview/)
[Django-rest-framework unittest extension](https://www.django-rest-framework.org/api-guide/testing/)

## TODO selenium and integration testing 

## Common beginner's mistakes 
MUST NOT use mutable default parameters values in functions, unless having a very good reason to do so. (explicitly and exhaustively document its usage with rationale for such design choice):

```Python
"""
Default parameter value is evaluated on function definition, each call to function mutating the parameter will mutate the default value. Read more: https://docs.python-guide.org/writing/gotchas/.
"""

# DO
def (param: List = None):
    param = []
    pass

# DO NOT
def (param: List = []):
    pass
```

