#!/bin/sh

tar -xf master.tar.gz

cd OpenLara-master/src/platform/nix
./build.sh
cd ../../../bin/
./OpenLara