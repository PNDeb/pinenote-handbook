#!/usr/bin/env sh

./generate_html.sh
dpkg-buildpackage -us -uc

# ########################################################################## #
# Move packages to release subdirectory

test -d release && rm -r release
mkdir release
mv ../*.deb release/
mv ../*.buildinfo ../*.changes release/
mv ../*.dsc release/
mv ../*.tar.xz release/
