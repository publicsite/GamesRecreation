#!/bin/sh
thepwd="$PWD"

mkdir mountpoint

pathToISO=""

while true; do
	pathToISO="$(zenity --title="Select an ISO file" --file-selection)"
echo ${pathToISO} | rev | cut -c 1-4
	if [ "$(echo ${pathToISO} | rev | cut -c 1-4 )" != "osi." ] && [ "$(echo ${pathToISO} | rev | cut -c 1-4 )" != "OSI." ]; then
		zenity --error --title "Error" --text "Please select an ISO file"
	elif [ ! -f "${pathToISO}" ]; then
		zenity --error --title "Error" --text "Please select an ISO file"
	else
		break;
	fi
done
echo "${pathToISO}"
sudo mount -o loop "${pathToISO}" mountpoint

#mkdir -p ".wine/drive_c/keeperfx/sound"
#mkdir -p ".wine/drive_c/keeperfx/data"
#mkdir -p ".wine/drive_c/keeperfx/music"

find "mountpoint/Keeper/data" -type f -exec cp -a "{}" ".wine/drive_c/keeperfx/data/" \;
find "mountpoint/Keeper/sound" -type f -exec cp -a "{}" ".wine/drive_c/keeperfx/sound/" \;

cd .wine/drive_c/keeperfx/data
for f in `find .`; do mv -v "$f" "`echo $f | tr '[A-Z]' '[a-z]'`"; done
cd ../sound
for f in `find .`; do mv -v "$f" "`echo $f | tr '[A-Z]' '[a-z]'`"; done
cd ../../../../

#cp -a "mountpoint/Keeper/data/BLUEPAL.DAT" ".wine/drive_c/keeperfx/data/bluepal.dat"
#cp -a "mountpoint/Keeper/data/BLUEPALL.DAT" ".wine/drive_c/keeperfx/data/bluepall.dat"
#cp -a "mountpoint/Keeper/data/DOGPAL.PAL" ".wine/drive_c/keeperfx/data/dogpal.pal"
#cp -a "mountpoint/Keeper/data/HITPALL.DAT" ".wine/drive_c/keeperfx/data/hitpall.dat"
#cp -a "mountpoint/Keeper/data/LIGHTNG.PAL" ".wine/drive_c/keeperfx/data/lightng.pal"
#cp -a "mountpoint/Keeper/data/REDPAL.COL" ".wine/drive_c/keeperfx/data/redpal.col"
#cp -a "mountpoint/Keeper/data/REDPALL.DAT" ".wine/drive_c/keeperfx/data/redpall.dat"
#cp -a "mountpoint/Keeper/data/SLAB0-0.DAT" ".wine/drive_c/keeperfx/data/slab0-0.dat"
#cp -a "mountpoint/Keeper/data/SLAB0-1.DAT" ".wine/drive_c/keeperfx/data/slab0-1.dat"
#cp -a "mountpoint/Keeper/data/VAMPAL.PAL" ".wine/drive_c/keeperfx/data/vampal.pal"
#cp -a "mountpoint/Keeper/data/WHITEPAL.COL" ".wine/drive_c/keeperfx/data/whitepal.col"
#cp -a "mountpoint/Keeper/data/CREATURE.TAB" ".wine/drive_c/keeperfx/data/creature.tab"
#cp -a "mountpoint/Keeper/data/PALETTE.DAT" ".wine/drive_c/keeperfx/data/palette.dat"
#cp -a "mountpoint/Keeper/data/NOCD.PAL" ".wine/drive_c/keeperfx/data/nocd.pal"
#cp -a "mountpoint/Keeper/data/NOCD.RAW" ".wine/drive_c/keeperfx/data/nocd.raw"
#cp -a "mountpoint/Keeper/data/ALPHA.COL" ".wine/drive_c/keeperfx/data/alpha.col"
#cp -a "mountpoint/Keeper/data/ALPHA.RAW" ".wine/drive_c/keeperfx/data/alpha.raw"
#cp -a "mountpoint/Keeper/data/PAL00000.DAT" ".wine/drive_c/keeperfx/data/pal00000.dat"
#cp -a "mountpoint/Keeper/data/PAL00001.DAT" ".wine/drive_c/keeperfx/data/pal00001.dat"
#cp -a "mountpoint/Keeper/data/PAL00002.DAT" ".wine/drive_c/keeperfx/data/pal00002.dat"
#cp -a "mountpoint/Keeper/data/PAL00003.DAT" ".wine/drive_c/keeperfx/data/pal00003.dat"
#cp -a "mountpoint/Keeper/data/PAL00004.DAT" ".wine/drive_c/keeperfx/data/pal00004.dat"

#cp -a "mountpoint/Keeper/sound/ATMOS1.SBK" ".wine/drive_c/keeperfx/sound/atmos1.sbk"
#cp -a "mountpoint/Keeper/sound/ATMOS2.SBK" ".wine/drive_c/keeperfx/sound/atmos2.sbk"
#cp -a "mountpoint/Keeper/sound/BULLFROG.SBK" ".wine/drive_c/keeperfx/sound/bullfrog.sbk"

cd "${thepwd}/.wine/dosdevices"

ln -s ../../mountpoint d:
ln -s /dev/loop0 d::

cd "${thepwd}/.wine/drive_c/keeperfx"

#export WINEPREFIX="/home/user/MyStuffBenjsAgain/programming/GAMERECREATIONS/recreations/DUNGEON_KEEPER/.wine"
firejail --private="$thepwd" --private-cwd="/home/$(whoami)/.wine/drive_c/keeperfx" wine "C:\\\keeperfx\\\keeperfx.exe"
#wine "C:\\\keeperfx\\\keeperfx.exe"

cd ${thepwd}

sudo umount mountpoint

rmdir mountpoint