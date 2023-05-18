#!/usr/bin/env bash

set -eu -o pipefail

pkg=${1%/}

if [ -z "${pkg}" ]; then
  echo "Please provide package name!"
  exit 1
fi

nvchecker -e "${pkg}" -c check.toml
new_ver=$(jq -r .\""${pkg}"\" new_ver.json)
cd "${pkg}"

old_ver=$(grep -P '^pkgver' PKGBUILD | cut -d= -f2)
[ "${old_ver}" = "${new_ver}" ] && echo "${pkg} is already at ${new_ver}" && exit 0
[ "$(vercmp "${old_ver}" "${new_ver}")" -eq 1 ] && echo "The old_ver=${old_ver} is greater than new_ver=${new_ver}." && exit 1

sed -E -i "s/pkgver=.*/pkgver=${new_ver}/" PKGBUILD
sed -E -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg
makepkg --printsrcinfo > .SRCINFO
cd ..

nvtake "${pkg}" -c check.toml
