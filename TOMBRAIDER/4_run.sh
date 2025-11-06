#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

cd OpenTomb-master

./OpenTomb

umask "${OLD_UMASK}"
