#!/bin/bash
# 5.20. Diffutils-3.5
set -e
cd $LFS/sources
rm -rf diffutils-3.5
tar xf diffutils-3.5.tar.xz
cd diffutils-3.5

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf diffutils-3.5
