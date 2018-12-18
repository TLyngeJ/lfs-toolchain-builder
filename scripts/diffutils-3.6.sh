#!/bin/bash
# 5.20. Diffutils-3.6
set -e
cd $LFS/sources
rm -rf diffutils-3.6
tar xf diffutils-3.6.tar.xz
cd diffutils-3.6

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf diffutils-3.6
