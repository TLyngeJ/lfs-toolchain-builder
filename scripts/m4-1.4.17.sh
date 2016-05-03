#!/bin/bash
# 5.26. M4-1.4.17
set -e
cd $LFS/sources
rm -rf m4-1.4.17
tar xf m4-1.4.17.tar.xz
cd m4-1.4.17

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf m4-1.4.17
