#!/bin/bash
# 5.22. Gawk-4.1.3
set -e
cd $LFS/sources
rm -rf gawk-4.1.3
tar xf gawk-4.1.3.tar.xz
cd gawk-4.1.3

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf gawk-4.1.3
