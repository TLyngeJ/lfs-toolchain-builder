#!/bin/bash
# 5.18. Coreutils-8.25
set -e
cd $LFS/sources
rm -rf coreutils-8.25
tar xf coreutils-8.25.tar.xz
cd coreutils-8.25

export FORCE_UNSAFE_CONFIGURE=1

./configure --prefix=/tools --enable-install-program=hostname
make
make install

cd $LFS/sources
rm -rf coreutils-8.25
