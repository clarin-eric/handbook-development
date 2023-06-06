#!/bin/bash
set -euo pipefail
SCRIPT_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo "Building mdl image"
docker build -q --tag 'clarin-mdl:latest' "${SCRIPT_DIR}/docker/markdownlint"

echo "Linting..."
if docker run --rm --name markdownlint\
	-v "${SCRIPT_DIR}:/work" \
	-w /work/docs \
	'clarin-mdl:latest'; then
	echo "OK"	
fi
