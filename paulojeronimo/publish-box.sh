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
VERSION=${VERSION:-"2020-02-17"}
FIX=${FIX:-"01"}
NAME=${NAME:-"paulojeronimo-archlinux"}
BOX=${BOX:-"../$NAME-$VERSION.box"}

cd "$BASE_DIR"
echo vagrant cloud publish $NAME $VERSION.$FIX virtualbox $NAME-$VERSION.box
