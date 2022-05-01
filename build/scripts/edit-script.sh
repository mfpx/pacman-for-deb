#!/usr/bin/bash

input=$1
output=$2
mode=$3

sed \
  -e "s|@rootdir[@]|/|g" \
  -e "s|@localedir[@]|/usr/share/locale|g" \
  -e "s|@sysconfdir[@]|/etc|g" \
  -e "s|@localstatedir[@]|/var|g" \
  -e "s|@libmakepkgdir[@]|/usr/share/makepkg|g" \
  -e "s|@pkgdatadir[@]|/usr/share/pacman|g" \
  -e "s|@prefix[@]|/usr|g" \
  -e "1s|#!/bin/bash|#!/usr/bin/bash|g" \
  -e "s|@PACKAGE_VERSION[@]|6.0.1|g" \
  -e "s|@PACKAGE_NAME[@]|pacman|g" \
  -e "s|@BUILDSCRIPT[@]|PKGBUILD|g" \
  -e "s|@TEMPLATE_DIR[@]|/usr/share/makepkg-template|g" \
  -e "s|@DEBUGSUFFIX[@]|debug|g" \
  -e "s|@INODECMD[@]|stat -c '%i %n'|g" \
  -e "s|@FILECMD[@]|file -S|g" \
  "$input" >"$output"

if [[ $mode ]]; then
  chmod "$mode" "$output"
fi
