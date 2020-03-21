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

# Docker
tee /etc/modules-load.d/loop.conf <<< "loop"
modprobe loop
pacman -S --noconfirm docker
systemctl start docker.service
systemctl enable docker.service
gpasswd -a vagrant docker
