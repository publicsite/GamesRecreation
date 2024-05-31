#!/bin/sh

tar -xf master.tar.gz

cd SurrealEngine-master
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make