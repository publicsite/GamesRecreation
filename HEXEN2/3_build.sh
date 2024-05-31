#!/bin/sh

cd "$(dirname "$0")"

find . -maxdepth 1 -type f -name "*.tgz" -exec tar -xf "{}" \;

cd hexen2source-1.5.9

sed -i 's%#include "SDL.h"%#include <SDL/SDL.h>%g' engine/h2shared/sdl_inc.h
sed -i 's%#include "SDL.h"%#include <SDL/SDL.h>%g' engine/h2shared/SDLMain.m

cd engine/hexen2

make glh2

cd ../../h2patch

make

cd ../../Hexen2/INSTALL/HEXEN2

cp -a ../../../gamecode-1.29b/patch111/patchdat .

mkdir -p ${HOME}/.hexen2/data1

cp -a ../../../gamecode-1.29b/res/h2/* ${HOME}/.hexen2/data1/

../../../hexen2source-1.5.9/h2patch/h2patch