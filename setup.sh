#!/bin/bash
set -euo pipefail

MKDOKS_YML="mkdocs.yml"
SCRIPT_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo "Checking for existence of ${MKDOKS_YML} in ${SCRIPT_DIR}"
if [ -e "${SCRIPT_DIR}/${MKDOKS_YML}" ]; then
	echo "File or directory already exists: ${MKDOKS_YML} - aborting setup"
	exit 1
fi 

echo "Building mkdocs image"
docker build --tag 'mkdocs:latest' 'docker/mkdocs'

echo "Initiating docs project"
docker run -v "${SCRIPT_DIR}:/work" -w '/work' 'mkdocs:latest' new '/work'
