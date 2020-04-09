#/usr/bin/env bash
#
DEBUG=${DEBUG:-false}
$DEBUG && set -x || set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
source "$BASE_DIR"/mybox/common.sh
cd "$BASE_DIR"

box_date=${box_date:-$(date +%F)}
box_name=${box_name:-$my_name/archlinux-$box_type}
box=${box:-$PWD/$my_name-archlinux-$box_type-$box_date.box}

[ -f "$box" ] || { echo "Box ($box) not found!"; exit 1; }
cmd="vagrant box add --force --name \"$box_name\" \"$box\""
echo $cmd
eval $cmd
