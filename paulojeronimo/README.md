# Scripts to create my Arch Linux version

## create-box.sh

This script will generate the `paulojeronimo/archlinux` box, by using a local Arch Linux mirror.
This box is used by the project [dev-box](https://github.com/paulojeronimo/dev-box).
The local mirror is created (and synced) by the
[archlinux-mirror-syncrhronizer](https://github.com/paulojeronimo/archlinux-mirror-synchronizer) project.
So, before running it, make sure that this mirror is running on localhost:8000.

You can use the paramenter `light` to this script in order to build a box without a graphical environment.

## add-box.sh

This will add the generated box to Vagrant.
By default, it will put this box on `~/.vagrant` directory.

## remove-box.sh

This script will remove the box register on Vagrant by deleting the corresponding directories:
`~/.vagrant.d/boxes/paulojeronimo*archlinux`.

## update-my-fork.sh

Just a small script to update my fork with its upstream.

## publish-box.sh

Publish the generetade box on [Vagrant Cloud](https://app.vagrantup.com/).
