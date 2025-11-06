#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

CorsixTH-master/build/CorsixTH/corsix-th

umask "${OLD_UMASK}"
