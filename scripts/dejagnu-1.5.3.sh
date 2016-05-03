#!/bin/bash
# 5.13. DejaGNU-1.5.3
set -e
cd $LFS/sources
rm -rf dejagnu-1.5.3
tar xf dejagnu-1.5.3.tar.gz
cd dejagnu-1.5.3

./configure --prefix=/tools
make install

cd $LFS/sources
rm -rf dejagnu-1.5.3
