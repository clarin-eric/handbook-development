#!/bin/bash
set -euo pipefail
SCRIPT_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo "Building mdl image"
docker build --quiet --tag 'mdl:latest' "${SCRIPT_DIR}/docker/mdl"

docker run --rm --name markdown_lint \
	-v "${SCRIPT_DIR}:${SCRIPT_DIR}" -w "${WORKDIR:-$(pwd -P)}" \
	'mdl:latest' "$@"
