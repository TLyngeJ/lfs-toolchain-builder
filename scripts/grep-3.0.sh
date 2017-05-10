#!/bin/bash
# 5.25. Grep-3.0
set -e
cd $LFS/sources
rm -rf grep-3.0
tar xf grep-3.0.tar.xz
cd grep-3.0

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf grep-3.0
