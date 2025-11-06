#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

#for these scripts
sudo apt-get install wget zenity

sudo apt-get install libopenal-dev libsdl2-dev libpng12-dev libglu1-mesa-dev zlib1g-dev

wget "https://github.com/opentomb/OpenTomb/archive/refs/heads/master.tar.gz"

umask "${OLD_UMASK}"
