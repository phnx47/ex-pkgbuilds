#!/bin/sh

set -e

pkg=${1%/}

if [ -z "$pkg" ]; then
  echo "Please provide package name!"
  exit 1
fi

nvchecker -c check.toml
new_ver=$(cat new_ver.json | jq .\"${pkg}\")

new_ver="${new_ver%\"}"
new_ver="${new_ver#\"}"

cd ${pkg}

old_ver=$(grep -P '^pkgver' PKGBUILD | cut -d= -f2)
[ "${old_ver}" = "${new_ver}" ] && echo "${pkg} is already at ${new_ver}" && exit 0
[ $(vercmp "${old_ver}" "${new_ver}") -eq 1 ] && echo "The old_ver=${old_ver} is greater than new_ver=${new_ver}." && exit 1

sed -E -i "s/pkgver=.*/pkgver=${ver}/" PKGBUILD
sed -E -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
# 'aurpublish' auto generate .SRCINFO
# makepkg --printsrcinfo > .SRCINFO
makepkg
cd ..

nvtake ${pkg} -c check.toml
