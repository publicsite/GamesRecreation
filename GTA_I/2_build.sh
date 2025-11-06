#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"
cp -a carnage3d carnage3d.bak
cd carnage3d
make

umask "${OLD_UMASK}"
