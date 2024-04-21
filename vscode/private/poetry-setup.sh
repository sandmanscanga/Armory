#!/bin/bash

poetry add requests beautifulsoup4
poetry add --group dev bandit black blacken-docs bumpversion colorama colorlog ipdb ipython isort mypy notebook pre-commit psutil pylint python-dotenv rich
poetry add --group testing coverage pygments-pytest pytest pytest-benchmark pytest-cov pytest-emoji pytest-logdog pytest-menu pytest-mock pytest-pretty pytest-sorter pytest-threadleak
poetry add --group docs click-man doc-utils mkdocs mkdocstrings mkdocstrings-python pdoc3 pydocstyle
