#/usr/bin/env bash
#
DEBUG=${DEBUG:-false}
$DEBUG && set -x || set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
source "$BASE_DIR"/mybox/common.sh

rm -rf ~/.vagrant.d/boxes/${my_name}*archlinux-$box_type
