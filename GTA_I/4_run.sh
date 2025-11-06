#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"
thebin="$(find "$PWD/carnage3d/.build/bin" -type f -name carnage3d | head -n 1)"

if [ -f "$thebin" ]; then
	cd "$PWD/carnage3d/gamedata"
	$thebin -gtadata "$PWD" -mapname SANB.CMP
fi

umask "${OLD_UMASK}"
