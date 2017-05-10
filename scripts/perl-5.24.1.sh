#!/bin/bash
# 5.30. Perl-5.24.1
set -e
cd $LFS/sources
rm -rf perl-5.24.1
tar xf perl-5.24.1.tar.bz2
cd perl-5.24.1

sh Configure -des -Dprefix=/tools -Dlibs=-lm
make
cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.24.1
cp -Rv lib/* /tools/lib/perl5/5.24.1

cd $LFS/sources
rm -rf perl-5.24.1
