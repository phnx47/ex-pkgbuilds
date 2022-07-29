#!/bin/sh

set -e

pkg=${1%/}

if [ -z "$pkg" ]; then
  echo "Please provide package!"
  exit 1
fi

nvchecker -c check.toml
ver=$(cat new_ver.json | jq .\"${pkg}\")

ver="${ver%\"}"
ver="${ver#\"}"

cd ${pkg}
sed -E -i "s/pkgver=.*/pkgver=${ver}/" PKGBUILD
sed -E -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
cd ..

nvtake ${pkg} -c check.toml
