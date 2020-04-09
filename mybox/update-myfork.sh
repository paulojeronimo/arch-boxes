#!/usr/bin/env bash
# * Refs:
# ** https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork
# ** https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork
#
DEBUG=${DEBUG:-false}
$DEBUG && set -x || set +x
set -euo pipefail

BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
source "$BASE_DIR"/mybox/common.sh
cd "$BASE_DIR"

if ! git remote | grep -q upstream
then
  git remote add upstream $git_remote_upstream
fi
git fetch upstream
git checkout master
git merge upstream/master
