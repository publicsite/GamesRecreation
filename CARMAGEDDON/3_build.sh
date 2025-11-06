#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

tar -xf main.tar.gz

export DETHRACE_ROOT_DIR="$PWD/Max-Pack"

cd dethrace-main

echo "main" >> VERSION

mkdir build
cd build
cmake ..

make

umask "${OLD_UMASK}"
