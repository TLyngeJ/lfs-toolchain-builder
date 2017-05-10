#!/bin/bash
# 5.23. Gawk-4.1.4
set -e
cd $LFS/sources
rm -rf gawk-4.1.4
tar xf gawk-4.1.4.tar.xz
cd gawk-4.1.4

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf gawk-4.1.4
