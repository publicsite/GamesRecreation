#!/bin/sh
thepwd="$PWD"


cd "${thepwd}/.wine/drive_c/keeperfx"
firejail --private="$thepwd" --private-cwd="/home/$(whoami)/.wine/drive_c/keeperfx" wine "C:\\\keeperfx\\\keeperfx.exe"