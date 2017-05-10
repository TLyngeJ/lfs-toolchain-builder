#!/bin/bash
# 5.27. M4-1.4.18
set -e
cd $LFS/sources
rm -rf m4-1.4.18
tar xf m4-1.4.18.tar.xz
cd m4-1.4.18

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf m4-1.4.18
