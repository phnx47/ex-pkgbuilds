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
sed -E -i "s/pkgver=.*/pkgver=${nver}/" "${pkgname}/PKGBUILD"
sed -E -i "s/pkgrel=.*/pkgrel=1/" "${pkgname}/PKGBUILD"

src=$(taplo get -f check.toml "${srcname}".source)

if [ "${src}" = "github" ] && grep -q "_sha=" "${pkgname}/PKGBUILD"; then
  echo "GitHub source with '_sha'. Using GitHub API"
  repo=$(taplo get -f check.toml "${srcname}".github)
  vprefix=$(taplo get -f check.toml "${srcname}".prefix)
  sha=$(curl "https://api.github.com/repos/${repo}/commits/${vprefix}${nver}" | jq -r '.sha')
  sed -E -i "s/_sha=.*/_sha='${sha}'/" "${pkgname}/PKGBUILD"
fi

if [ "${pkgname}" = "ledger-live" ]; then
  echo "Using GitHub API"
  sha=$(curl "https://api.github.com/repos/LedgerHQ/ledger-live/commits/@ledgerhq/live-desktop@${nver}" | jq -r '.sha')
  sed -E -i "s/_sha=.*/_sha='${sha}'/" "${pkgname}/PKGBUILD"
fi

cd "${pkgname}"
updpkgsums
makepkg -scC
makepkg --printsrcinfo >.SRCINFO
cd ..

nvtake "${srcname}" -c check.toml
