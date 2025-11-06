#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

#for these scripts
sudo apt-get install wget zenity

sudo apt-get install build-essential libsdl1.2-compat-dev libmad0-dev
wget "https://sourceforge.net/projects/uhexen2/files/Hammer%20of%20Thyrion/1.5.9/Source/hexen2source-1.5.9.tgz/download" -O hexen2source-1.5.9.tgz
wget "https://sourceforge.net/projects/uhexen2/files/Hammer%20of%20Thyrion/1.5.9/Source/hexen2source-gamecode-1.5.9.tgz/download" -O hexen2source-gamecode-1.5.9.tgz
wget "https://sourceforge.net/projects/uhexen2/files/Hammer%20of%20Thyrion/1.5.9/Source/hexen2source-oslibs-1.5.9.tgz/download" -O hexen2source-oslibs-1.5.9.tgz
wget "https://sourceforge.net/projects/uhexen2/files/Hammer%20of%20Thyrion/1.5.9/Source/hexen2source-oslibs-source-1.5.9.tgz/download" -O hexen2source-oslibs-source-1.5.9.tgz
wget "https://sourceforge.net/projects/uhexen2/files/Hammer%20of%20Thyrion/1.5.9/Source/README-source.txt/download" -O README-source.txt

umask "${OLD_UMASK}"
