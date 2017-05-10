#!/bin/bash
# 5.26. Gzip-1.8
set -e
cd $LFS/sources
rm -rf gzip-1.8
tar xf gzip-1.8.tar.xz
cd gzip-1.8

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf gzip-1.8
