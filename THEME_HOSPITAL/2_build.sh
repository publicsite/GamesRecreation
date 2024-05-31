#!/bin/sh

cd "$(dirname "$0")"

tar -xf master.tar.gz

cd CorsixTH-master

mkdir build
cd build
cmake -DUSE_SOURCE_DATADIRS=ON ..

make