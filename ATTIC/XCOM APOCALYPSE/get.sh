#!/bin/sh
sudo apt-get install libsdl2-dev cmake build-essential git libunwind8-dev libboost-locale-dev libboost-program-options-dev qtbase5-dev libvorbis-dev
git clone https://github.com/OpenApoc/OpenApoc
cd OpenApoc
git submodule update --init --recursive