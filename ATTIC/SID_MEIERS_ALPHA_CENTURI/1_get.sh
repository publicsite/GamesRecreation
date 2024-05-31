#!/bin/sh

sudo apt-get install cmake build-essential libfreetype-dev libsdl2-dev libsdl2-image-dev libglu-dev libglew-dev libossp-uuid-dev libyaml-cpp-dev

git clone https://github.com/afwbkbc/glsmac

cd glsmac

#so we can keep a local copy
git show -s --format='#define GLSMAC_LAST_COMMIT "%h"' > src/tmp/last_commit.h
sed -i 's#> ${PROJECT_SOURCE_DIR}/src/tmp/last_commit.h##g' CMakeLists.txt
sed -i "s#git show#echo show#g" CMakeLists.txt