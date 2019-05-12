# Maintainer: Max O'Cull <max ocull protonmail com>

pkgname=st
pkgver=0.8.2
pkgrel=2
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
makedepends=('ncurses')
url="http://st.suckless.org"
source=(http://dl.suckless.org/st/$pkgname-$pkgver.tar.gz
        config.h
        boxdraw-patch.diff
        https://$pkgname.suckless.org/patches/alpha/$pkgname-alpha-$pkgver.diff
        https://$pkgname.suckless.org/patches/anysize/$pkgname-anysize-0.8.1.diff
        https://$pkgname.suckless.org/patches/xresources/$pkgname-xresources-20190105-3be4cf1.diff
      )
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
          )

prepare() {
  # user is supposed to maintain config.h him/herself
  cp $srcdir/config.h $srcdir/$pkgname-$pkgver/config.h

  cp $srcdir/$pkgname-alpha-$pkgver.diff $srcdir/$pkgname-$pkgver/alpha-patch.diff
  cp $srcdir/$pkgname-anysize-*.diff $srcdir/$pkgname-$pkgver/anysize-patch.diff
  cp $srcdir/$pkgname-xresources-*.diff $srcdir/$pkgname-$pkgver/xresources-patch.diff

  # cp $srcdir/alpha-patch.diff $srcdir/$pkgname-$pkgver/alpha-patch.diff
  # cp $srcdir/anysize-patch.diff $srcdir/$pkgname-$pkgver/anysize-patch.diff
  # cp $srcdir/xresources-patch.diff $srcdir/$pkgname-$pkgver/xresources-patch.diff
  cp $srcdir/boxdraw-patch.diff $srcdir/$pkgname-$pkgver/boxdraw-patch.diff

  # wget https://$pkgname.suckless.org/patches/alpha/$pkgname-alpha-$pkgver.diff -O $srcdir/$pkgname-$pkgver/alpha-patch.diff
  # wget https://$pkgname.suckless.org/patches/anysize/$pkgname-anysize-0.8.1.diff -O $srcdir/$pkgname-$pkgver/anysize-patch.diff
  # wget https://$pkgname.suckless.org/patches/boxdraw/$pkgname-boxdraw_v2-$pkgver.diff -O $srcdir/$pkgname-$pkgver/boxdraw-patch.diff
  # wget https://$pkgname.suckless.org/patches/xresources/$pkgname-xresources-20190105-3be4cf1.diff -O $srcdir/$pkgname-$pkgver/xresources-patch.diff
}

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < alpha-patch.diff
  patch -p1 < anysize-patch.diff
  patch -p1 < xresources-patch.diff
  patch -p1 < boxdraw-patch.diff
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  # remove to avoid conflict with ncurses
  rm "${pkgdir}/usr/share/terminfo/s/st" "${pkgdir}/usr/share/terminfo/s/st-256color"
}
