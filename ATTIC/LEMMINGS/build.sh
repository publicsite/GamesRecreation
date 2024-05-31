#!/bin/sh

tar -xf master.tar.gz

cd lemmini-master

./preprocessor.pl generic
./make.sh jar