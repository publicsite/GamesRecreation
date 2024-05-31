#!/bin/sh
sudo apt-get install git mingw-w64
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install wine32 firejail

git clone https://github.com/dkfans/keeperfx
cd keeperfx
git submodule sync && git submodule update --init

wget "https://github.com/dkfans/png2bestpal/archive/refs/tags/v1.0.3.tar.gz" -O png2bestpal_v1.0.3.tar.gz
wget "https://github.com/dkfans/png2ico/archive/refs/tags/2003-01-14.tar.gz" -O png2ico_2003-01-14.tar.gz
wget "https://github.com/dkfans/pngpal2raw/archive/refs/tags/v1.0.2.tar.gz" -O pngpal2raw_v1.0.2.tar.gz
wget "https://github.com/dkfans/po2ngdat/archive/refs/tags/v1.0.2.31.tar.gz" -O po2ngdat_v1.0.2.31.tar.gz
wget "https://github.com/dkfans/sndbanker/archive/refs/tags/v1.0.1.tar.gz" -O sndbanker_v1.0.1.tar.gz
wget "https://github.com/dkfans/rnctools/archive/refs/tags/v1.0.2.tar.gz" -O rnctools_v1.0.2.tar.gz

wget "https://github.com/libsdl-org/SDL/releases/download/release-2.30.3/SDL2-2.30.3.tar.gz"
wget "https://github.com/libsdl-org/SDL_net/releases/download/release-2.2.0/SDL2_net-2.2.0.tar.gz"
wget "https://github.com/libsdl-org/SDL_mixer/releases/download/release-2.8.0/SDL2_mixer-2.8.0.tar.gz"
wget "https://github.com/libsdl-org/SDL_image/releases/download/release-2.8.2/SDL2_image-2.8.2.tar.gz"