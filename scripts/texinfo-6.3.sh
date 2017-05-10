#!/bin/bash
# 5.33. Texinfo-6.3
set -e
cd $LFS/sources
rm -rf texinfo-6.3
tar xf texinfo-6.3.tar.xz
cd texinfo-6.3

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf texinfo-6.3
