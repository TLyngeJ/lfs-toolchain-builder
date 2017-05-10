#!/bin/bash
# 5.6. Linux-4.9.9 API Headers
set -e
cd $LFS/sources
rm -rf linux-4.9.9
tar xf linux-4.9.9.tar.xz
cd linux-4.9.9

make mrproper
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

cd $LFS/sources
rm -rf linux-4.9.9
