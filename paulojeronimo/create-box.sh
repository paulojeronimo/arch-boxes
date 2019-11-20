#/usr/bin/env bash
set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
cd "$BASE_DIR"

packer build -only=virtualbox-iso paulojeronimo/local.json
