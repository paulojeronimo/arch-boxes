#/usr/bin/env bash
set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
cd "$BASE_DIR"

box_type=${1:-default}
box_date=${box_date:-$(date +%F)}
box_name=${box_name:-paulojeronimo/archlinux-$box_type}
box=${box:-$PWD/paulojeronimo-archlinux-$box_type-$box_date.box}

[ -f "$box" ] || { echo "Box ($box) not found!"; exit 1; }
cmd="vagrant box add --force --name \"$box_name\" \"$box\""
echo $cmd
eval $cmd
