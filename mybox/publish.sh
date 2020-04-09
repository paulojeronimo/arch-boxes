#!/usr/bin/env bash
#
# == Refs
# * https://www.vagrantup.com/docs/cli/cloud.html
#
# == Command prerequisites
#
# ++++
# vagrant cloud auth login
# ++++

DEBUG=${DEBUG:-false}
$DEBUG && set -x || set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
source "$BASE_DIR"/mybox/common.sh

VERSION=${VERSION:-$(date +%F)}
FIX=${FIX:-"01"}
NAME=${NAME:-"$my_name-archlinux-$box_type"}
BOX=${BOX:-"../$NAME-$VERSION.box"}

cd "$BASE_DIR"
vagrant cloud publish $NAME $VERSION.$FIX virtualbox $NAME-$VERSION.box
