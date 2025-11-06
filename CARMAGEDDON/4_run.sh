#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

export DETHRACE_ROOT_DIR="$PWD/Max-Pack"
dethrace-main/build/dethrace

umask "${OLD_UMASK}"
