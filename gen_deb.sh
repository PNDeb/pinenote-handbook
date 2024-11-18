#!/usr/bin/env sh
# Script used by Github CI to generate Debian images from within the Docker
# container

cd /root/pn_handbook
git clone https://github.com/PNDeb/pinenote-handbook.git
cd pinenote-handbook

# build the handbook
./generate_html.sh
cp -r files/etc/greeter/html /github/home/handbook
# handbook end

./build_pkg.sh
cp -r release /github/home/
ls -l /github/home
