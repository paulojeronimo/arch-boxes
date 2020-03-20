#/usr/bin/env bash
set +x
set -eo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
cd "$BASE_DIR"

if ! lsof -i4TCP:8000 | grep -q LISTEN
then
  echo "Local Arch Linux mirror must be running!"
  exit 1
fi

json=local.json
if [ "$1" = "light" ]
then
  (
    cd paulojeronimo
    patch $json local-light.diff -o local-$1.json
  )
  json=local-$1.json
fi
packer build -only=virtualbox-iso paulojeronimo/$json
