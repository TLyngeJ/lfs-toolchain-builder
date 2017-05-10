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
  if (( "${#files[@]}" != 79 )); then
    echo "ARRGGHH! I see ${#files[@]} in $LFS/sources when I should see 79. Bailing out here!"
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

if [[ ! -d /mnt/lfs/sources/logs ]]; then
  mkdir /mnt/lfs/sources/logs
fi

echo
echo "************************************"
echo "* Now, for building daz toolchain! *"
echo "************************************"
echo
# 5.4. Binutils-2.27 - Pass 1
echo "Building: 5.4. Binutils-2.27 - Pass 1 (31 packages left)"
sh /scripts/binutils-2.27.sh > /mnt/lfs/sources/logs/binutils-2.27 2>&1
# 5.5. GCC-6.3.0 - Pass 1
echo "Building: 5.5. GCC-6.3.0 - Pass 1 (30 packages left)"
sh /scripts/gcc-6.3.0.sh > /mnt/lfs/sources/logs/gcc-6.3.0 2>&1
# 5.6. Linux-4.9.9 API Headers
echo "Building: 5.6. Linux-4.9.9 API Headers (29 packages left)"
sh /scripts/linux-4.9.9.sh > /mnt/lfs/sources/logs/linux-4.9.9 2>&1
# 5.7. Glibc-2.25
echo "Building: 5.7. Glibc-2.25 (28 packages left)"
sh /scripts/glibc-2.25.sh > /mnt/lfs/sources/logs/glibc-2.25 2>&1
# 5.8. Libstdc++-6.3.0
echo "Building: 5.8. Libstdc++-6.3.0 (27 packages left)"
sh /scripts/libstdc++-6.3.0.sh > /mnt/lfs/sources/logs/libstdc++-6.3.0 2>&1
# 5.9. Binutils-2.27 - Pass 2
echo "Building: 5.9. Binutils-2.27 - Pass 2 (26 packages left)"
sh /scripts/binutils-2.27-pass2.sh > /mnt/lfs/sources/logs/binutils-2.27-pass2 2>&1
# 5.10. GCC-6.3.0 - Pass 2
echo "Building: 5.10. GCC-6.3.0 - Pass 2 (25 packages left)"
sh /scripts/gcc-6.3.0-pass2.sh > /mnt/lfs/sources/logs/gcc-6.3.0-pass2 2>&1
# 5.11. Tcl-core-8.6.6
echo "Building: 5.11. Tcl-core-8.6.6 (24 packages left)"
sh /scripts/tcl-core8.6.6.sh > /mnt/lfs/sources/logs/tcl-core8.6.6 2>&1
# 5.12. Expect-5.45
echo "Building: 5.12. Expect-5.45 (23 packages left)"
sh /scripts/expect5.45.sh > /mnt/lfs/sources/logs/expect5.45 2>&1
# 5.13. DejaGNU-1.6
echo "Building: 5.13. DejaGNU-1.6 (22 packages left)"
sh /scripts/dejagnu-1.6.sh > /mnt/lfs/sources/logs/dejagnu-1.6 2>&1
# 5.14. Check-0.11.0
echo "Building: 5.14. Check-0.11.0 (21 packages left)"
sh /scripts/check-0.11.0.sh > /mnt/lfs/sources/logs/check-0.11.0 2>&1
# 5.15. Ncurses-6.0
echo "Building: 5.15. Ncurses-6.0 (20 packages left)"
sh /scripts/ncurses-6.0.sh > /mnt/lfs/sources/logs/ncurses-6.0 2>&1
# 5.16. Bash-4.4
echo "Building: 5.16. Bash-4.4 (19 packages left)"
sh /scripts/bash-4.4.sh > /mnt/lfs/sources/logs/bash-4.4 2>&1
# 5.17. Bison-3.0.4
echo "Building: 5.17. Bison-3.0.4 (18 packages left)"
sh /scripts/bison-3.0.4.sh > /mnt/lfs/sources/logs/bison-3.0.4 2>&1
# 5.18. Bzip2-1.0.6
echo "Building: 5.18. Bzip2-1.0.6 (17 packages left)"
sh /scripts/bzip2-1.0.6.sh > /mnt/lfs/sources/logs/bzip2-1.0.6 2>&1
# 5.19. Coreutils-8.26
echo "Building: 5.19. Coreutils-8.26 (16 packages left)"
sh /scripts/coreutils-8.26.sh > /mnt/lfs/sources/logs/coreutils-8.26 2>&1
# 5.20. Diffutils-3.5
echo "Building: 5.20. Diffutils-3.5 (15 packages left)"
sh /scripts/diffutils-3.5.sh > /mnt/lfs/sources/logs/diffutils-3.5 2>&1
# 5.21. File-5.30
echo "Building: 5.21. File-5.30 (14 packages left)"
sh /scripts/file-5.30.sh > /mnt/lfs/sources/logs/file-5.30 2>&1
# 5.22. Findutils-4.6.0
echo "Building: 5.22. Findutils-4.6.0 (13 packages left)"
sh /scripts/findutils-4.6.0.sh > /mnt/lfs/sources/logs/findutils-4.6.0 2>&1
# 5.23. Gawk-4.1.4
echo "Building: 5.23. Gawk-4.1.4 (12 packages left)"
sh /scripts/gawk-4.1.4.sh > /mnt/lfs/sources/logs/gawk-4.1.4 2>&1
# 5.24. Gettext-0.19.8.1
echo "Building: 5.24. Gettext-0.19.8.1 (11 packages left)"
sh /scripts/gettext-0.19.8.1.sh > /mnt/lfs/sources/logs/gettext-0.19.8.1 2>&1
# 5.25. Grep-3.0
echo "Building: 5.25. Grep-3.0 (10 packages left)"
sh /scripts/grep-3.0.sh > /mnt/lfs/sources/logs/grep-3.0 2>&1
# 5.26. Gzip-1.8
echo "Building: 5.26. Gzip-1.8 (9 packages left)"
sh /scripts/gzip-1.8.sh > /mnt/lfs/sources/logs/gzip-1.8 2>&1
# 5.27. M4-1.4.18
echo "Building: 5.27. M4-1.4.18 (8 packages left)"
sh /scripts/m4-1.4.18.sh > /mnt/lfs/sources/logs/m4-1.4.18 2>&1
# 5.28. Make-4.2.1
echo "Building: 5.28. Make-4.2.1 (7 packages left)"
sh /scripts/make-4.2.1.sh > /mnt/lfs/sources/logs/make-4.2.1 2>&1
# 5.29. Patch-2.7.5
echo "Building: 5.29. Patch-2.7.5 (6 packages left)"
sh /scripts/patch-2.7.5.sh > /mnt/lfs/sources/logs/patch-2.7.5 2>&1
# 5.30. Perl-5.24.1
echo "Building: 5.30. Perl-5.24.1 (5 packages left)"
sh /scripts/perl-5.24.1.sh > /mnt/lfs/sources/logs/perl-5.24.1 2>&1
# 5.31. Sed-4.4
echo "Building: 5.31. Sed-4.4 (4 packages left)"
sh /scripts/sed-4.4.sh > /mnt/lfs/sources/logs/sed-4.4 2>&1
# 5.32. 5.31. Tar-1.29
echo "Building: 5.31. Tar-1.29 (3 packages left)"
sh /scripts/tar-1.29.sh > /mnt/lfs/sources/logs/tar-1.29 2>&1
# 5.33. Texinfo-6.3
echo "Building: 5.32. Texinfo-6.3 (2 packages left)"
sh /scripts/texinfo-6.3.sh > /mnt/lfs/sources/logs/texinfo-6.3 2>&1
# 5.34. Util-linux-2.29.1
echo "Building: 5.33. Util-linux-2.29.1 (1 package left)"
sh /scripts/util-linux-2.29.1.sh > /mnt/lfs/sources/logs/util-linux-2.29.1 2>&1
# 5.35. Xz-5.2.3
echo "Building: 5.34. Xz-5.2.3 (last package)"
sh /scripts/xz-5.2.3.sh > /mnt/lfs/sources/logs/xz-5.2.3 2>&1

echo
echo "**************************************"
echo "* Stripping                          *"
echo "* (But you can leave your hat on!)   *"
echo "* It is safe to ignore any warnings. *"
echo "**************************************"
echo
strip --strip-debug /tools/lib/*
/usr/bin/strip --strip-unneeded /tools/{,s}bin/*
rm -rf /tools/{,share}/{info,man,doc}
rm -rf /mnt/lfs/sources/logs

echo
echo "****************************************************"
echo "* Tool chain has now been build.                   *"
echo "* You can now build the base Linux                 *"
echo "* From Scratch base syste.                         *"
echo "* Visit https://github.com/TLyngeJ/lfs-base-system *"
echo "* for more info.                                   *"
echo "****************************************************"
echo
