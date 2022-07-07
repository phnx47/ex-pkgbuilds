[github]: https://github.com/sponsors/phnx47
[bmac]: https://www.buymeacoffee.com/phnx47
[ko-fi]: https://ko-fi.com/phnx47

# PKGBUILDs

[![Maintainer](https://img.shields.io/static/v1?style=flat-square&label=AUR&message=phnx47&color=blue)](https://aur.archlinux.org/packages?SeB=M&K=phnx47)
[![License](https://img.shields.io/github/license/phnx47/PKGBUILDs?style=flat-square&label=License)](LICENSE)

This repository contains the packages phnx47 maintain in [AUR](https://aur.archlinux.org/packages?SeB=M&K=phnx47), checked into git as subtrees for easier management and pull requests.

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

### GitHub Actions

Check new versions and send an email with the list with new versions

```yml
name: Check Versions
on:
  schedule:
    - cron: "55 */24 * * *"

jobs:
  check:
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout
        uses: actions/checkout@master
        with:
          fetch-depth: 0

      - name: Install ubuntu deps
        run: sudo apt-get update && sudo apt-get install libssl-dev libcurl4-openssl-dev

      - name: Install nvchecker
        run: pip install nvchecker

      - name: Run check.sh
        run: ./check.sh >> new-vers.txt

      - name: Read new-vers.txt
        id: new-vers
        uses: juliangruber/read-file-action@master
        with:
          trim: false
          path: ./new-vers.txt

      - name: Send email
        if: "endsWith(steps.new-vers.outputs.content, '\n')"
        uses: wadeww/send-email-action@master
        with:
          server_address: [[URL of SMTP server]]
          port: 465
          username: ${{ secrets.MAIL_USERNAME }}
          password: ${{ secrets.MAIL_PASSWORD }}
          subject: AUR - New Versions
          body: ${{ steps.new-vers.outputs.content }}
          to: [[Comma-separated recipient list]]
          from: [[Sender email address]]
```

## Support

If you like what I'm accomplishing, feel free to buy me a coffee

[<img align="left" alt="phnx47 | GitHub Sponsors" width="32px" src="https://raw.githubusercontent.com/phnx47/files/main/button-sponsors/github0.svg" />][github]
[<img align="left" alt="phnx47 | Buy Me a Coffee" width="32px" src="https://raw.githubusercontent.com/phnx47/files/main/button-sponsors/bmac0.png" />][bmac]
[<img align="left" alt="phnx47 | Kofi" width="32px" src="https://raw.githubusercontent.com/phnx47/files/main/button-sponsors/kofi0.png" />][ko-fi]

&nbsp; 

## License

All contents of this package are licensed under the [GNU General Public License version 3](https://opensource.org/licenses/GPL-3.0).
