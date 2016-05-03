#!/bin/bash
# 5.25. Gzip-1.6
set -e
cd $LFS/sources
rm -rf gzip-1.6
tar xf gzip-1.6.tar.xz
cd gzip-1.6

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf gzip-1.6
