#!/bin/bash
# 5.34. Util-linux-2.29.1
set -e
cd $LFS/sources
rm -rf util-linux-2.29.1
tar xf util-linux-2.29.1.tar.xz
cd util-linux-2.29.1

./configure --prefix=/tools                \
            --without-python               \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            PKG_CONFIG=""
make
make install

cd $LFS/sources
rm -rf util-linux-2.29.1
