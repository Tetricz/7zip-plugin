#!/bin/bash
echo "Downloading files..."
DATA_DIR="$PWD"
mkdir -p "$DATA_DIR/7z/usr/bin"
wget -O /tmp/7z2201-linux-x64.tar.xz https://www.7-zip.org/a/7z2201-linux-x64.tar.xz
tar -xvf /tmp/7z2201-linux-x64.tar.xz 7zz
mv 7zz ./7z/usr/bin/7zz
cd "$DATA_DIR/7z/usr/bin"
ln -s 7zz 7z
ln -s 7zz 7zip
cd "$DATA_DIR/7z"

echo "Creating package..."
makepkg -l y -c y ../7zz-x64-$(date +%Y%m%d).txz
echo $(md5sum ../7zz-x64-$(date +%Y%m%d).txz | awk '{print $1}') 7zz-x64-$(date +%Y%m%d).txz > ../7zz-x64-$(date +%Y%m%d).txz.md5

echo "removing temporary files..."
cd "$DATA_DIR"
rm -rf "$DATA_DIR/7z"