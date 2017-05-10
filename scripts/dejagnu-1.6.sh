#!/bin/bash
# 5.13. DejaGNU-1.6
set -e
cd $LFS/sources
rm -rf dejagnu-1.6
tar xf dejagnu-1.6.tar.gz
cd dejagnu-1.6

./configure --prefix=/tools
make install

cd $LFS/sources
rm -rf dejagnu-1.6
