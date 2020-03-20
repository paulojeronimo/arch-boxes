#!/bin/bash

set -e
set -x

sudo pacman -S --noconfirm virtualbox-guest-utils virtualbox-guest-modules-arch
sudo systemctl enable vboxservice

# Admin packages
sudo pacman -S --noconfirm \
  lsb-release \
  parted \
  lsof \
  tmux \
  vim \
  tree \
  git \
  rsync

# Dev packages
sudo pacman -S --noconfirm \
  gcc \
  glibc \
  make \
  python2 \
  chromium \
  asciidoctor

if [ "$1" != "light" ]
then
  # Graphical environment
  sudo pacman -S --noconfirm \
    xorg xorg-xinit \
    deepin deepin-extra \
    ttf-freefont \
    lightdm lightdm-gtk-greeter
  sudo systemctl enable lightdm
fi
