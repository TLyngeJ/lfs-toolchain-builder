#!/bin/bash
# 5.23. Gettext-0.19.7
set -e
cd $LFS/sources
rm -rf gettext-0.19.7
tar xf gettext-0.19.7.tar.xz
cd gettext-0.19.7

cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared
make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext
cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin

cd $LFS/sources
rm -rf gettext-0.19.7
