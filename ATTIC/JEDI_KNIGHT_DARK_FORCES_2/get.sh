# Make sure everything is up to date before installing new dependencies
sudo apt-get update
sudo apt-get upgrade

# All
sudo apt install git build-essential cmake make python3 python3-pip bison imagemagick libgtk-3-dev protobuf-compiler zsh libpng-dev libcurl4-openssl-dev pipx
pipx install cogapp

# On some Ubuntu versions (22.04?)
sudo apt install libstdc++-12-dev

# Win32/MinGW
sudo apt install mingw-w64

# Linux 32-bit
# TODO find equivalents: multilib-devel lib32-sdl2 lib32-glew lib32-openal

# Linux 64-bit
sudo apt install clang libsdl2-dev libsdl2-mixer-dev libopenal-dev libglew-dev libssl-dev libprotobuf-dev

#get OpenJKDF2

wget "https://github.com/shinyquagsire23/OpenJKDF2/archive/refs/heads/master.tar.gz" -O OpenJKDF2-master.tar.gz

#get dependencies (see https://raw.githubusercontent.com/shinyquagsire23/OpenJKDF2/master/.gitmodules )

wget "https://github.com/pnggroup/libpng/archive/refs/tags/v1.6.39.tar.gz" -O libpng-v1.6.39.tar.gz

wget "https://github.com/freeglut/freeglut/archive/refs/tags/v3.4.0.tar.gz" -O freeglut-v3.4.0.tar.gz

wget "https://github.com/Perlmint/glew-cmake/archive/refs/heads/master.tar.gz" -O glew-cmake-master.tar.gz

wget "https://github.com/madler/zlib/archive/refs/tags/v1.2.13.tar.gz" -O zlib-v1.2.13.tar.gz

wget "https://github.com/ValveSoftware/GameNetworkingSockets/archive/refs/tags/v1.4.1.tar.gz" -O GameNetworkingSockets-v1.4.1.tar.gz

wget "https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.12.tar.gz" -O protobuf-v21.12.tar.gz

wget "https://github.com/icculus/physfs/archive/refs/tags/release-3.2.0.tar.gz" -O physfs-v3.2.0.tar.gz

wget "https://github.com/kcat/openal-soft/archive/refs/tags/1.23.1.tar.gz" -O openal-soft-v1.23.1.tar.gz

wget "https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.26.5.tar.gz" -O SDL-v2.26.5.tar.gz

wget "https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-2.8.0.tar.gz" -O SDL_mixer-v2.8.0.tar.gz

#for SDL_mixer

wget "https://github.com/libsdl-org/ogg/archive/refs/tags/v1.3.5.tar.gz" -O ogg-v1.3.5.tar.gz
wget "https://github.com/libsdl-org/opus/archive/refs/tags/v1.4.tar.gz" -O opus-v1.4.tar.gz
wget "https://github.com/libsdl-org/opusfile/archive/refs/tags/v0.12.tar.gz" -O opusfile-v0.12.tar.gz