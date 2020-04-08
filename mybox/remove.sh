#/usr/bin/env bash
set +x
set -euo pipefail

box_type=${1:-default}
rm -rf ~/.vagrant.d/boxes/paulojeronimo*archlinux-$box_type
