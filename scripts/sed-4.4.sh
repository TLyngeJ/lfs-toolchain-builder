#!/bin/bash
# 5.31. Sed-4.4
set -e
cd $LFS/sources
rm -rf sed-4.4
tar xf sed-4.4.tar.xz
cd sed-4.4

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf sed-4.4
