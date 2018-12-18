#!/bin/bash
# 5.32. Texinfo-6.5
set -e
cd $LFS/sources
rm -rf texinfo-6.5
tar xf texinfo-6.5.tar.xz
cd texinfo-6.5

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf texinfo-6.5
