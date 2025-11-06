#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

cd Hexen2/INSTALL/HEXEN2

../../../hexen2source-1.5.9/engine/hexen2/glhexen2

umask "${OLD_UMASK}"
