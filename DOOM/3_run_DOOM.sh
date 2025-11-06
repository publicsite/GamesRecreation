#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

chocolate-doom -iwad doom.wad

umask "${OLD_UMASK}"
