#/usr/bin/env bash
set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
cd "$BASE_DIR"

if ! lsof -i4TCP:8000 | grep -q LISTEN
then
  echo "Local Arch Linux mirror must be running!"
  exit 1
fi

box_type=${1:-default}
json=local.json
(
  cd paulojeronimo
  sed "s/BOX_TYPE/$box_type/g" $json > local-$box_type.json
)
json=local-$box_type.json
packer build -only=virtualbox-iso paulojeronimo/$json
