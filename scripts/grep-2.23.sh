#!/bin/bash
# 5.24. Grep-2.23
set -e
cd $LFS/sources
rm -rf grep-2.23
tar xf grep-2.23.tar.xz
cd grep-2.23

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf grep-2.23
