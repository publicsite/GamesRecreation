#!/bin/sh

cd "$(dirname "$0")"

#for these scripts
sudo apt-get install wget zenity

#for the game
sudo apt-get install libsdl2-dev

wget "https://github.com/dethrace-labs/dethrace/archive/refs/heads/main.tar.gz"