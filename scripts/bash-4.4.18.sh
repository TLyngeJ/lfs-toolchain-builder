#!/bin/bash
# 5.16. Bash-4.4.18
set -e
cd $LFS/sources
rm -rf bash-4.4.18
tar xf bash-4.4.18.tar.gz
cd bash-4.4.18

./configure --prefix=/tools --without-bash-malloc
make
make install
ln -sv bash /tools/bin/sh

cd $LFS/sources
rm -rf bash-4.4.18
