#!/bin/bash
# 5.21. Findutils-4.6.0
set -e
cd $LFS/sources
rm -rf findutils-4.6.0
tar xf findutils-4.6.0.tar.gz
cd findutils-4.6.0

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf findutils-4.6.0
