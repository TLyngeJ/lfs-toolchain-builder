#!/bin/bash
# 5.18. Bzip2-1.0.6
set -e
cd $LFS/sources
rm -rf bzip2-1.0.6
tar xf bzip2-1.0.6.tar.gz
cd bzip2-1.0.6

make
make PREFIX=/tools install

cd $LFS/sources
rm -rf bzip2-1.0.6
