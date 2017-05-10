#!/bin/bash
# 5.8. Libstdc++-6.3.0
set -e
cd $LFS/sources
rm -rf gcc-6.3.0
tar xf gcc-6.3.0.tar.bz2
cd gcc-6.3.0

mkdir -v build
cd       build
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/6.3.0
make
make install

cd $LFS/sources
rm -rf gcc-6.3.0
