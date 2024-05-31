#!/bin/sh
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

cp -a mountpoint Max-Pack

sudo umount mountpoint

rmdir mountpoint