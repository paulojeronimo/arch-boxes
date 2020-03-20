#!/usr/bin/env bash
# * Refs:
# ** https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork
# ** https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork
BASE_DIR=`cd "$(dirname "$0")/.."; pwd`
cd "$BASE_DIR"

git remote add upstream https://github.com/archlinux/arch-boxes.git
git fetch upstream
git checkout master
git merge upstream master
