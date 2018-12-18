#!/bin/bash
# 5.31. Tar-1.30
set -e
cd $LFS/sources
rm -rf tar-1.30
tar xf tar-1.30.tar.xz
cd tar-1.30

export FORCE_UNSAFE_CONFIGURE=1

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf tar-1.30
