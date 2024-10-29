#!/bin/bash
set -euo pipefail
SCRIPT_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo "Linting *.md files" \
	&& find . -type f -name '*.md'| xargs bash "${SCRIPT_DIR}/mdl.sh"