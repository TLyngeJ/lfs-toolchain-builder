#!/bin/bash
# 5.7. Glibc-2.23
set -e
cd $LFS/sources
rm -rf glibc-2.23
tar xf glibc-2.23.tar.xz
cd glibc-2.23

mkdir -v build
cd       build
../configure                             \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --disable-profile                  \
      --enable-kernel=2.6.32             \
      --enable-obsolete-rpc              \
      --with-headers=/tools/include      \
      libc_cv_forced_unwind=yes          \
      libc_cv_ctors_header=yes           \
      libc_cv_c_cleanup=yes
make
make install

cd $LFS/sources
rm -rf glibc-2.23
