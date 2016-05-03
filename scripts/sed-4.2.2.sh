#!/bin/bash
# 5.30. Sed-4.2.2
set -e
cd $LFS/sources
rm -rf sed-4.2.2
tar xf sed-4.2.2.tar.bz2
cd sed-4.2.2

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf sed-4.2.2
