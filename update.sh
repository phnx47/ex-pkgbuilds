#!/usr/bin/env bash

set -eu -o pipefail

pkgname="${1%/}"
srcname="${pkgname%-bin}"

echo "pkgname=${pkgname}"
echo "srcname=${srcname}"

if [ -z "${pkgname}" ]; then
  echo "Please provide pkgname!"
  exit 1
fi

nvchecker -e "${srcname}" -c check.toml
nver=$(jq -r .\""${srcname}"\" nver.json)
cd "${pkgname}"

sed -E -i "s/pkgver=.*/pkgver=${nver}/" PKGBUILD
sed -E -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg
makepkg --printsrcinfo > .SRCINFO
cd ..

nvtake "${srcname}" -c check.toml
