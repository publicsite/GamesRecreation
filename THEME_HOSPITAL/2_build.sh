#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

tar -xf master.tar.gz

cd CorsixTH-master

mkdir build
cd build
cmake -DUSE_SOURCE_DATADIRS=ON ..

make

umask "${OLD_UMASK}"
