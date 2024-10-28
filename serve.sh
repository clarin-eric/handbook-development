#!/bin/bash
set -euo pipefail
SCRIPT_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

if [ "$#" -ge 1 ]; then
	MKDOCS_SERVER_PORT="$1"
else
	echo "Usage: $0 <port>"
	exit 1
fi

echo "Building mkdocs image"
docker build --tag 'mkdocs:latest' 'docker/mkdocs'

echo "Starting server on http://localhost:${MKDOCS_SERVER_PORT}/"
docker run --rm -ti --name mkdocs_serve\
	-v "${SCRIPT_DIR}:/work" \
	-w '/work' \
	-p "${MKDOCS_SERVER_PORT}:${MKDOCS_SERVER_PORT}" \
	'mkdocs:latest' serve -a "0.0.0.0:${MKDOCS_SERVER_PORT}"
