#!/usr/bin/env bash

curl -o /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/?country=BR
sed -i 's/#S/S/g' /etc/pacman.d/mirrorlist
