#!/bin/sh

cd "$(dirname "$0")"

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

mkdir -p Hexen2/INSTALL

cp -a mountpoint/INSTALL/HEXEN2 Hexen2/INSTALL/

chown -R $(whoami):$(whoami) Hexen2

chmod -R u+w Hexen2

sudo umount mountpoint

rmdir mountpoint