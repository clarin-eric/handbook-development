# General

PEP [https://www.python.org/dev/peps/] is a set of Python community guidelines that is a baseline for our guidelines. If you adhere to explicit PEP you can't go wrong, however as PEPs can clash with each other we explicitly state preferred standards further.

### Script vs Software
Script is automation of a task, software is a script with assigned life cycle. 
Automation of tasks can be conducted using Python, but we highly recommend using Bash as a default scripting language. However, it may be beneficial to use Python in certain applications, e.g. educational content, data manipulation, data visualisation, etc. We do not impose any explicit requirements and guidelines on Python scripts. It is up to the programmer to wage pros and cons of automation using Python in a given context, to be aware of target group and adjust programming practices to the context in which they are applied. Following guidelines apply only to the software meant for deployment. 

### Python vs Cython
#TODO

### Code style
MUST enforce constistant design choices within each self-standing software/package
MUST follow PEP8 [https://peps.python.org/pep-0008/] guidelines on code styling
MUST statically hint type PEP484 [https://peps.python.org/pep-0484/]
MUST duck hint type PEP544 [https://peps.python.org/pep-0544/]
MUST follow minimal docstring conventions PEP257 [https://peps.python.org/pep-0257/]
SHOULD use Sphinx [https://sphinx-rtd-tutorial.readthedocs.io/en/latest/docstrings.html] docstring syntax. Any other well defined convention is acceptable, but Sphinx is preferred. Remember to maintain consistant conventions within self-contained packages. 

### Common beginner's mistakes
NEVER use mutable default parameters values in functions, unless having a very good reason to do so. (explicitly and exhaustively document it's usage with rationale for such design choice):

```Python
"""
Default parameter value is evaluated on function definition, each call to function mutating the parameter will mutate default value. Read more: https://docs.python-guide.org/writing/gotchas/.
"""

# DO
def (param: List = None):
    param = []
    pass

# DO NOT
def (param: List = []):
    pass
```

# Frameworks & libraries
### Django
For web applications we use Django (https://docs.djangoproject.com/) by default. Always strive for latest LTS Django support. 

### Django REST framework
Should use Django-rest-framework (https://www.django-rest-framework.org/) for REST API implementation. Flask is also fine, but we have no experience in working with Flask. Developers are free to explore other options and in future expand on this section

### XML processing
For `.xml` files processing we recommend using lxml (https://lxml.de/). 

### Logging:
Python core logging (https://docs.python.org/3/library/logging.html). Django logging utilises core Python logging making it fully compatible.


# Build & CI
Use `pip` as default package manage
	- On Alpine package registry [https://pkgs.alpinelinux.org/packages] has priority over PyPi (don't install/build with `pip` if `apk` available). 
	- With depreciaciation of setuptools strive for `pyproject.toml` [] as default SCM with [] `Poetry` backend. (as of 04.07.2013 some of the setuptools functionalities are still Beta for pytoml+poetry SCM, in case of clashes fall back for legacy setup.py)
	- Build wheels and install package from the wheel PEP427 [https://peps.python.org/pep-0427/] whenever possible. Instalations from `stdist` only as last resort. 

# Testing tools
### Unittest
https://docs.python.org/3/library/unittest.html

### Django unittest extension
https://docs.djangoproject.com/en/4.2/topics/testing/overview/

### Django REST Framework unittest extension
https://www.django-rest-framework.org/api-guide/testing/

### #TODO selenium and integration testing
