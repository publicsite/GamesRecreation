#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

#for these scripts
sudo apt-get install wget zenity

sudo apt install libglew-dev libglm-dev libgl1-mesa-dev xorg-dev clang
sudo apt-get install libopenal-dev

git clone --recurse-submodules https://github.com/codenamecpp/carnage3d

umask "${OLD_UMASK}"
