#!/bin/sh

#tar -xf master.tar.gz

cd TheForceEngine-master
mkdir tfe-build
cd tfe-build

cmake ..

make