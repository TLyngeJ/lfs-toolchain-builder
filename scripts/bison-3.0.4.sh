#!/bin/bash
# 5.17. Bison-3.0.4
set -e
cd $LFS/sources
rm -rf bison-3.0.4
tar xf bison-3.0.4.tar.xz
cd bison-3.0.4

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf bison-3.0.4
