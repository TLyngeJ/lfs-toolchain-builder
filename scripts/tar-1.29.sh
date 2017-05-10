#!/bin/bash
# 5.32. Tar-1.29
set -e
cd $LFS/sources
rm -rf tar-1.29
tar xf tar-1.29.tar.xz
cd tar-1.29

export FORCE_UNSAFE_CONFIGURE=1
./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf tar-1.29
