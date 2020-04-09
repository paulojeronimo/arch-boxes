#/usr/bin/env bash
#
DEBUG=${DEBUG:-false}
$DEBUG && set -x || set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
source "$BASE_DIR"/mybox/common.sh
cd "$BASE_DIR"

if ! lsof -i4TCP:8000 | grep -q LISTEN
then
  echo "Local Arch Linux mirror must be running!"
  exit 1
fi

json=local.json
(
  cd mybox
  sed "
    s,ISO_URL,$iso_url,g;
    s,ISO_CHECKSUM_URL,$iso_checksum_url,g;
    s/MY_NAME/$my_name/g;
    s/BOX_TYPE/$box_type/g
  " $json > local-$box_type.json
)
json=local-$box_type.json
packer build -only=virtualbox-iso mybox/$json
