#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

#for these scripts
sudo apt-get install wget zenity

#for the game
sudo apt-get install build-essential cmake git libsdl2-dev libsdl2-mixer-dev timidity libfreetype6-dev lua-filesystem lua-lpeg doxygen liblua5.3-0 liblua5.3-0-dbg liblua5.3-dev
sudo apt-get install libavcodec-dev libavformat-dev libavutil-dev libavdevice-dev libswscale-dev libpostproc-dev libswresample-dev libavfilter-dev

sudo apt-get install ffmpeg libavcodec-dev libavformat-dev libavresample-dev libavdevice-dev libavutil-dev libavfilter-dev libswscale-dev libpostproc-dev libswresample-dev

sudo apt-get install curl libcurl4-openssl-dev

wget "https://github.com/CorsixTH/CorsixTH/archive/refs/heads/master.tar.gz"

umask "${OLD_UMASK}"
