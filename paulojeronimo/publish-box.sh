#!/usr/bin/env bash
# == Refs
# * https://www.vagrantup.com/docs/cli/cloud.html
#
# == Command prerequisites
#
# ++++
# vagrant cloud auth login
# ++++

set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
VERSION=${VERSION:-$(date +%F)}
FIX=${FIX:-"01"}
TYPE=${1:-default}
NAME=${NAME:-"paulojeronimo-archlinux-$TYPE"}
BOX=${BOX:-"../$NAME-$VERSION.box"}

cd "$BASE_DIR"
echo vagrant cloud publish $NAME $VERSION.$FIX virtualbox $NAME-$VERSION.box
