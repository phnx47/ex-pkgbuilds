[gh-sponsors]: https://github.com/sponsors/phnx47
[bmac]: https://www.buymeacoffee.com/phnx47
[ko-fi]: https://ko-fi.com/phnx47
[aur]: https://aur.archlinux.org/packages?SeB=M&K=phnx47

# PKGBUILDs

[![aur](https://img.shields.io/static/v1?style=flat-square&label=aur&message=phnx47&color=blue&logo=archlinux)][aur]
[![nvchecker](https://img.shields.io/github/actions/workflow/status/phnx47/pkgbuilds/nvchecker.yml?branch=main&label=nvchecker&logo=github&style=flat-square)](https://github.com/phnx47/pkgbuilds/actions/workflows/nvchecker.yml)
[![license](https://img.shields.io/github/license/phnx47/pkgbuilds?style=flat-square)](LICENSE)

This repository contains the packages phnx47 maintain in [AUR][aur], checked into git as subtrees for easier management and pull requests.

Powered by [aurpublish](https://github.com/eli-schwartz/aurpublish) and [nvchecker](https://github.com/lilydjwg/nvchecker).

## How to Use

### Install dependecies

```sh
pacman -S nvchecker aurpublish
```

### Initialize GitHooks

```sh
aurpublish setup
```

### Check new versions

```sh
./check.sh
```

### Update to new version

```sh
./update.sh PACKAGE
```

## Support

If you like what I'm accomplishing, feel free to buy me a coffee

[<img align="left" alt="phnx47 | GitHub Sponsors" width="32px" src="https://raw.githubusercontent.com/phnx47/files/main/button-sponsors/github0.svg" />][gh-sponsors]
[<img align="left" alt="phnx47 | Buy Me a Coffee" width="32px" src="https://raw.githubusercontent.com/phnx47/files/main/button-sponsors/bmac0.png" />][bmac]
[<img align="left" alt="phnx47 | Kofi" width="32px" src="https://raw.githubusercontent.com/phnx47/files/main/button-sponsors/kofi0.png" />][ko-fi]

&nbsp;

## License

All contents of this package are licensed under the [GNU General Public License version 3](https://opensource.org/licenses/GPL-3.0).
