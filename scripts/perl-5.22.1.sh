#!/bin/bash
# 5.29. Perl-5.22.1
set -e
cd $LFS/sources
rm -rf perl-5.22.1
tar xf perl-5.22.1.tar.bz2
cd perl-5.22.1

sh Configure -des -Dprefix=/tools -Dlibs=-lm
make
cp -v perl cpan/podlators/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.22.1
cp -Rv lib/* /tools/lib/perl5/5.22.1

cd $LFS/sources
rm -rf perl-5.22.1
