#!/usr/bin/env bash
set -x
set -e

pacman -S --noconfirm virtualbox-guest-utils virtualbox-guest-modules-arch
systemctl enable vboxservice

# Admin packages
pacman -S --noconfirm \
  lsb-release \
  parted \
  lsof \
  tmux \
  vim \
  tree \
  git \
  rsync

# Dev packages
pacman -S --noconfirm \
  gcc \
  glibc \
  make \
  python2 \
  chromium \
  asciidoctor

# Graphical environment
pacman -S --noconfirm \
  xorg xorg-xinit \
  deepin deepin-extra \
  ttf-freefont \
  lightdm lightdm-gtk-greeter
systemctl enable lightdm
