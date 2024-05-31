#!/bin/sh
thepwd="$PWD"
tar -xf nuclide-master.tar.gz
tar -xf freehl-master.tar.gz
mv freehl-master nuclide-master/valve
cp -a engine nuclide-master/src/

cd nuclide-master

sed -i "s#BUILD_UPDATE=1#BUILD_UPDATE=0#g" build.cfg
ODE_VER=0.16.2
sed -i "s#wget -N \$(ODE_URL)#cp -a $thepwd/ode-${ODE_VER}.tar.gz .#g" src/engine/plugins/Makefile

BULLET_VER=2.87
sed -i "s#wget -N \$(BULLET_URL) -O \$@#cp -a $thepwd/${BULLET_VER}.tar.gz \$@#g" src/engine/plugins/Makefile

./build_engine.sh

SKIP_UPDATE=1 SKIP_RADIANT=1 ./build_game.sh valve

sudo cp -a bin/fteqw ../halflife/