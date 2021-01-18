#!/bin/bash
# 5.17. Bison-3.0.5
set -e
cd $LFS/sources
rm -rf bison-3.0.5
tar xf bison-3.0.5.tar.xz
cd bison-3.0.5

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf bison-3.0.5
