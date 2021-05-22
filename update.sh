#!/bin/sh

set -e

pkg=${1}
ver=${2}

if [ -z "$pkg" ]; then echo "Please provide package!"; exit 1; fi
if [ -z "$ver" ]; then echo "Please provide version!"; exit 1; fi

cd ${pkg}
sed -E -i "s/pkgver=.*/pkgver=${ver}/" PKGBUILD
sed -E -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
cd ..

nvtake ${pkg} -c check.toml
