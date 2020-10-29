# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# Repository for PR: https://gitlab.com/phnx47-aur/ledger-live

pkgname=ledger-live
pkgver=2.15.0
pkgrel=3
pkgdesc="Ledger Live - Desktop"
arch=('x86_64')
url="https://www.ledgerwallet.com/live"
license=('MIT')
makedepends=(yarn python nodejs)

source=("https://github.com/LedgerHQ/ledger-live-desktop/archive/v${pkgver}.tar.gz"
        "ledger-live.desktop")
sha512sums=('9270380ef9d078fe1f7ad03d4e4e8b843c8ccf27ea35d21c61789c5649fd60927d7385ffd04d3c151e75adf28fb503ac962cd61a2b423d24413780d735f41db6'
            'bfdf0295b7225380c78ef1a3e1351529bd5ee0cecc17b1591ef20bd144d38e3c4aba0a4115c97131517c109698cf8d6db55c0744c7c6f194e8c61a0576c64fab')

extractedFolder=ledger-live-desktop-$pkgver

prepare() {
  cd $extractedFolder
  export JOBS=max
  yarn --ignore-scripts
}

build() {
  cd $extractedFolder
  export GIT_REVISION=$pkgver
  export JOBS=max
  yarn dist
}

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd $extractedFolder

  install -dm755 "${pkgdir}/opt"
  cp -r "dist/linux-unpacked" "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/ledger-live-desktop" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  install -Dm644 "build/icons/icon@2x.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 "build/icons/icon@3x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"  
  install -Dm644 "build/icons/icon@4x.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  install -Dm644 "build/icons/icon@5x.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
