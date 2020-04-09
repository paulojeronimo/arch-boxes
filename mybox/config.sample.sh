#!/usr/bin/env bash
#
# Path to Arch Linux ISO
iso_url=/Users/pj/Downloads/softwares/linux/archlinux/2020.03.01/archlinux-2020.03.01-x86_64.iso

# Path to Arch Linux sha1sums.txt
iso_checksum_url=/Users/pj/Downloads/softwares/linux/archlinux/2020.03.01/sha1sums.txt

# Name of the box
my_name=paulojeronimo

# Box type will compose the box name
# It is also a Bash script (with a .sh extension) inside provision directory
box_type=${1:-default}
