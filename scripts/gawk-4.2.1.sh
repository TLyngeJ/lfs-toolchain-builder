#!/bin/bash
# 5.23. Gawk-4.2.1
set -e
cd $LFS/sources
rm -rf gawk-4.2.1
tar xf gawk-4.2.1.tar.xz
cd gawk-4.2.1

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf gawk-4.2.1
