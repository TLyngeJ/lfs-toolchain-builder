#!/bin/bash
# 5.15. Ncurses-6.0
set -e
cd $LFS/sources
rm -rf ncurses-6.0
tar xf ncurses-6.0.tar.gz
cd ncurses-6.0

sed -i s/mawk// configure
./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite
make
make install

cd $LFS/sources
rm -rf ncurses-6.0
