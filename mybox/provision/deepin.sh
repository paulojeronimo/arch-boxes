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
  rsync \
  reflector

# Docker
tee /etc/modules-load.d/loop.conf <<< "loop"
modprobe loop
pacman -S --noconfirm docker
systemctl start docker.service
systemctl enable docker.service
gpasswd -a vagrant docker

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

# Reflector is the last command in this script. It is used to configure the default mirrorlist
# https://wiki.archlinux.org/index.php/Reflector
#reflector --country Brazil --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
