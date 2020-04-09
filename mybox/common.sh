#!/usr/bin/env bash

found=false
for cfg in config{,.sample}.sh
do
  source "$BASE_DIR"/mybox/$cfg 2> /dev/null && { found=true; break; }
done
$found || { echo "$cfg not found!" && exit 1; }
