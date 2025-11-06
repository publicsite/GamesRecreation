#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

cd "$(dirname "$0")"

tar -xf master.tar.gz

cd OpenTomb-master

#https://github.com/opentomb/OpenTomb/issues/610
mv src/core/system.h src/core/system.h.old
echo '#include <unistd.h>' > src/core/system.h
cat src/core/system.h.old >> src/core/system.h

cmake . && make

umask "${OLD_UMASK}"
