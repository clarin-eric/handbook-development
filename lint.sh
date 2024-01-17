#!/bin/bash
set -euo pipefail
SCRIPT_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo "Linting README" \
	&& bash "${SCRIPT_DIR}/mdl.sh" 'README.md' \
	&& echo "Linting docs" \
	&& export WORKDIR="${SCRIPT_DIR}/docs" \
	&& find "${WORKDIR}" -type f -name '*.md'| xargs bash "${SCRIPT_DIR}/mdl.sh"