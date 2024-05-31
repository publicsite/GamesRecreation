#!/bin/sh
find . -maxdepth 1 -type f -name "*.tar.gz" -exec tar -xf "{}" \;

find "freeglut-3.4.0" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/freeglut/ \;
rmdir freeglut-3.4.0
find "GameNetworkingSockets-1.4.1" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/GameNetworkingSockets/ \;
rmdir GameNetworkingSockets-1.4.1
find "glew-cmake-master" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/glew/ \;
rmdir glew-cmake-master
find "libpng-1.6.39" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/libpng/ \;
rmdir libpng-1.6.39
find "openal-soft-1.23.1" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/openal/ \;
rmdir openal-soft-1.23.1
find "physfs-release-3.2.0" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/physfs/ \;
rmdir physfs-release-3.2.0
find "protobuf-21.12" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/protobuf/ \;
rmdir protobuf-21.12
find "SDL-release-2.26.5" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/SDL/ \;
rmdir SDL-release-2.26.5
find "SDL_mixer-release-2.8.0" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/SDL_mixer/ \;
rmdir SDL_mixer-release-2.8.0
find "zlib-1.2.13" -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/zlib/ \;
rmdir zlib-1.2.13

find ogg-1.3.5 -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/SDL_mixer/external/ogg/ \;
rmdir ogg-1.3.5

find opus-1.4 -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/SDL_mixer/external/opus/ \;
rmdir opus-1.4

find opusfile-0.12 -maxdepth 1 -mindepth 1 -exec mv "{}" OpenJKDF2-master/lib/SDL_mixer/external/opusfile/ \;
rmdir opusfile-0.12

export PATH="$PATH:/home/$(whoami)/.local/bin"

cd OpenJKDF2-master

cd lib/GameNetworkingSockets

patch -p1 < ../../cmake_modules/GameNetworkingSockets_v1.4.1.patch

cd ../../cmake_modules

sed -i "s#git restore#echo git restore#g" build_gns.cmake
sed -i "s#git apply#echo git apply#g" build_gns.cmake

cd ..

export CC=clang
export CXX=clang++

chmod +x build_linux64.sh
./build_linux64.sh 2>&1 | tee ../buildlog.txt
##LD_LIBRARY_PATH=build_linux64 ./build_linux64/openjkdf2