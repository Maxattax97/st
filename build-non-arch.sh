#!/usr/bin/env bash

source ./PKGBUILD
srcdir="$(pwd)"

rm -rf $srcdir/$pkgname-*/
rm -rf $srcdir/*.tar.gz

wget -N "${source[0]}" -O "$srcdir/$pkgname-$pkgver.tar.gz"
tar -xzvf "$srcdir/$pkgname-$pkgver.tar.gz"

wget -N "${source[3]}" -P "$srcdir/"
wget -N "${source[4]}" -P "$srcdir/"
wget -N "${source[5]}" -P "$srcdir/"

prepare
build
