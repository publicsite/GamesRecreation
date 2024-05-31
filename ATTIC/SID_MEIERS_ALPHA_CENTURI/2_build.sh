#!/bin/sh

cp -a glsmac glsmac.bak

cd glsmac

mkdir build
cd build
cmake ..
make