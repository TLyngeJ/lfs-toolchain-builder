#!/bin/bash
# 5.9. Binutils-2.26 - Pass 2
set -e
cd $LFS/sources
rm -rf binutils-2.26
tar xf binutils-2.26.tar.bz2
cd binutils-2.26

mkdir -v build
cd       build
CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../configure                   \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot
make
make install
make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin

cd $LFS/sources
rm -rf binutils-2.26
