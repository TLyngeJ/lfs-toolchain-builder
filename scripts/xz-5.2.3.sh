#!/bin/bash
# 5.35. Xz-5.2.3
set -e
cd $LFS/sources
rm -rf xz-5.2.3
tar xf xz-5.2.3.tar.xz
cd xz-5.2.3

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf xz-5.2.3
