#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

#for these scripts
sudo apt-get install zenity

sudo apt-get install chocolate-doom

umask "${OLD_UMASK}"
