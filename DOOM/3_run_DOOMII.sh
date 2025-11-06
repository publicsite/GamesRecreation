#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

chocolate-doom -iwad doom2.wad

umask "${OLD_UMASK}"
