#!/bin/bash
# 5.11. Tcl-core-8.6.6
set -e
cd $LFS/sources
rm -rf tcl8.6.6
tar xf tcl-core8.6.6-src.tar.gz
cd tcl8.6.6

cd unix
./configure --prefix=/tools
make
make install
chmod -v u+w /tools/lib/libtcl8.6.so
make install-private-headers
ln -sv tclsh8.6 /tools/bin/tclsh

cd $LFS/sources
rm -rf tcl8.6.6
