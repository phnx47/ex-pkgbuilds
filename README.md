# PKGBUILDs

[![aur](https://img.shields.io/static/v1?style=flat-square&label=aur&message=phnx47&color=blue&logo=archlinux)](https://aur.archlinux.org/packages?SeB=M&K=phnx47)
[![nvchecker](https://img.shields.io/github/actions/workflow/status/phnx47/pkgbuilds/nvchecker.yml?branch=main&label=nvchecker&logo=github&style=flat-square)](https://github.com/phnx47/pkgbuilds/actions/workflows/nvchecker.yml)
[![license](https://img.shields.io/github/license/phnx47/pkgbuilds?style=flat-square)](LICENSE)

AUR packages that I maintain or co-maintain.

Powered by [aurpublish](https://github.com/phnx47/aurpublish) with a few changes and [nvchecker](https://github.com/lilydjwg/nvchecker).

## How to Use

### Check new versions

```sh
./check.sh
```

### Update to new version

```sh
./update.sh {pkgname}
```

### Cleanup git hooks created by some packages

```sh
./cleanup-githooks.sh
```

## License

This repository is licensed under the [GNU General Public License version 3](https://opensource.org/licenses/GPL-3.0).
