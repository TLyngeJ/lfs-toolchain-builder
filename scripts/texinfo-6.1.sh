#!/bin/bash
# 5.32. Texinfo-6.1
set -e
cd $LFS/sources
rm -rf texinfo-6.1
tar xf texinfo-6.1.tar.xz
cd texinfo-6.1

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf texinfo-6.1
