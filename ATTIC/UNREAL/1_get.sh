#!/bin/sh
sudo apt-get install git mingw-w64
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install wine32

sudo apt-get install cmake g++ libsdl2-dev firejail
wget https://github.com/dpjudas/SurrealEngine/archive/refs/heads/master.tar.gz
