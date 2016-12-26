#!/bin/bash

set -e
export LFS=/mnt/lfs
LFS=/mnt/lfs
if [[ ! -d $LFS/sources ]]; then
  echo
  echo "********************************"
  echo "* Fetching sources and patches *"
  echo "********************************"
  echo
  mkdir -v $LFS/sources
  chmod -v a+wt $LFS/sources
  echo "Downloading source files. This might take a while depending on your internet connection speed"
  cat /scripts/wget-list | xargs -n 1 -P 20 wget --continue --directory-prefix=$LFS/sources > /dev/null 2>&1

  # Verify we have all of the source files.
  shopt -s nullglob
  files=($LFS/sources/*)
  if (( "${#files[@]}" != 80 )); then
    echo "ARRGGHH! I see ${#files[@]} in $LFS/sources when I should see 80. Bailing out here!"
    exit
  fi

  shopt -u nullglob
  pushd $LFS/sources
  md5sum -c /scripts/md5sums
  popd
fi

# Prepare environment
if [[ ! -d $LFS/tools ]]; then
  mkdir -v $LFS/tools
fi
ln -sv $LFS/tools /

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF

source ~/.bashrc
export MAKEFLAGS='-j 14'

# Check host requirements are met.
# http://www.linuxfromscratch.org/lfs/view/stable/prologue/hostreqs.html
sh /scripts/reqs.sh

if [[ ! -d /scripts/logs ]]; then
  mkdir /scripts/logs
fi

echo
echo "************************************"
echo "* Now, for building daz toolchain! *"
echo "************************************"
echo
# 5.4. Binutils-2.26 - Pass 1
echo "Building: 5.4. Binutils-2.26 - Pass 1"
sh /scripts/binutils-2.26.sh > /scripts/logs/binutils-2.26 2>&1
# 5.5. GCC-5.3.0 - Pass 1
echo "Building: 5.5. GCC-5.3.0 - Pass 1"
sh /scripts/gcc-5.3.0.sh > /scripts/logs/gcc-5.3.0 2>&1
# 5.6. Linux-4.4.2 API Headers
echo "Building: 5.6. Linux-4.4.2 API Headers"
sh /scripts/linux-4.4.2.sh > /scripts/logs/linux-4.4.2 2>&1
# 5.7. Glibc-2.23
echo "Building: 5.7. Glibc-2.23"
sh /scripts/glibc-2.23.sh > /scripts/logs/glibc-2.23 2>&1
# 5.8. Libstdc++-5.3.0
echo "Building: 5.8. Libstdc++-5.3.0"
sh /scripts/libstdc++-5.3.0.sh > /scripts/logs/libstdc++-5.3.0 2>&1
# 5.9. Binutils-2.26 - Pass 2
echo "Building: 5.9. Binutils-2.26 - Pass 2"
sh /scripts/binutils-2.26-pass2.sh > /scripts/logs/binutils-2.26-pass2 2>&1
# 5.10. GCC-5.3.0 - Pass 2
echo "Building: 5.10. GCC-5.3.0 - Pass 2"
sh /scripts/gcc-5.3.0-pass2.sh > /scripts/logs/gcc-5.3.0-pass2 2>&1
# 5.11. Tcl-core-8.6.4
echo "Building: 5.11. Tcl-core-8.6.4"
sh /scripts/tcl-core8.6.4.sh > /scripts/logs/tcl-core8.6.4 2>&1
# 5.12. Expect-5.45
echo "Building: 5.12. Expect-5.45"
sh /scripts/expect5.45.sh > /scripts/logs/expect5.45 2>&1
# 5.13. DejaGNU-1.5.3
echo "Building: 5.13. DejaGNU-1.5.3"
sh /scripts/dejagnu-1.5.3.sh > /scripts/logs/dejagnu-1.5.3 2>&1
# 5.14. Check-0.10.0
echo "Building: 5.14. Check-0.10.0"
sh /scripts/check-0.10.0.sh > /scripts/logs/check-0.10.0 2>&1
# 5.15. Ncurses-6.0
echo "Building: 5.15. Ncurses-6.0"
sh /scripts/ncurses-6.0.sh > /scripts/logs/ncurses-6.0 2>&1
# 5.16. Bash-4.3.30
echo "Building: 5.16. Bash-4.3.30"
sh /scripts/bash-4.3.30.sh > /scripts/logs/bash-4.3.30 2>&1
# 5.17. Bzip2-1.0.6
echo "Building: 5.17. Bzip2-1.0.6"
sh /scripts/bzip2-1.0.6.sh > /scripts/logs/bzip2-1.0.6 2>&1
# 5.18. Coreutils-8.25
echo "Building: 5.18. Coreutils-8.25"
sh /scripts/coreutils-8.25.sh > /scripts/logs/coreutils-8.25 2>&1
# 5.19. Diffutils-3.3
echo "Building: 5.19. Diffutils-3.3"
sh /scripts/diffutils-3.3.sh > /scripts/logs/diffutils-3.3 2>&1
# 5.20. File-5.25
echo "Building: 5.20. File-5.25"
sh /scripts/file-5.25.sh > /scripts/logs/file-5.25 2>&1
# 5.21. Findutils-4.6.0
echo "Building: 5.21. Findutils-4.6.0"
sh /scripts/findutils-4.6.0.sh > /scripts/logs/findutils-4.6.0 2>&1
# 5.22. Gawk-4.1.3
echo "Building: 5.22. Gawk-4.1.3"
sh /scripts/gawk-4.1.3.sh > /scripts/logs/gawk-4.1.3 2>&1
# 5.23. Gettext-0.19.7
echo "Building: 5.23. Gettext-0.19.7"
sh /scripts/gettext-0.19.7.sh > /scripts/logs/gettext-0.19.7 2>&1
# 5.24. Grep-2.23
echo "Building: 5.24. Grep-2.23"
sh /scripts/grep-2.23.sh > /scripts/logs/grep-2.23 2>&1
# 5.25. Gzip-1.6
echo "Building: 5.25. Gzip-1.6"
sh /scripts/gzip-1.6.sh > /scripts/logs/gzip-1.6 2>&1
# 5.26. M4-1.4.17
echo "Building: 5.26. M4-1.4.17"
sh /scripts/m4-1.4.17.sh > /scripts/logs/m4-1.4.17 2>&1
# 5.27. Make-4.1
echo "Building: 5.27. Make-4.1"
sh /scripts/make-4.1.sh > /scripts/logs/make-4.1 2>&1
# 5.28. Patch-2.7.5
echo "Building: 5.28. Patch-2.7.5"
sh /scripts/patch-2.7.5.sh > /scripts/logs/patch-2.7.5 2>&1
# 5.29. Perl-5.22.1
echo "Building: 5.29. Perl-5.22.1"
sh /scripts/perl-5.22.1.sh > /scripts/logs/perl-5.22.1 2>&1
# 5.30. Sed-4.2.2
echo "Building: 5.30. Sed-4.2.2"
sh /scripts/sed-4.2.2.sh > /scripts/logs/sed-4.2.2 2>&1
# 5.30. 5.31. Tar-1.28
echo "Building: 5.31. Tar-1.28"
sh /scripts/tar-1.28.sh > /scripts/logs/tar-1.28 2>&1
# 5.32. Texinfo-6.1
echo "Building: 5.32. Texinfo-6.1"
sh /scripts/texinfo-6.1.sh > /scripts/logs/texinfo-6.1 2>&1
# 5.33. Util-linux-2.27.1
echo "Building: 5.33. Util-linux-2.27.1"
sh /scripts/util-linux-2.27.1.sh > /scripts/logs/util-linux-2.27.1 2>&1
# 5.34. Xz-5.2.2
echo "Building: 5.34. Xz-5.2.2"
sh /scripts/xz-5.2.2.sh > /scripts/logs/xz-5.2.2 2>&1

echo
echo "************************************"
echo "* Stripping                        *"
echo "* (But you can leave your hat on!) *"
echo "************************************"
echo
strip --strip-debug /tools/lib/*
/usr/bin/strip --strip-unneeded /tools/{,s}bin/*
rm -rf /tools/{,share}/{info,man,doc}
