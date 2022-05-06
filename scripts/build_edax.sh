#!/bin/bash
# shellcheck disable=SC2154
set -euxo pipefail

# NOTE: require some environment variables.
# edax_build_command (e.g. make build ARCH=x64-modern COMP=gcc OS=osx)
# edax_bin_name (e.g. mEdax)
# dst: (e.g. build)

git clone https://github.com/sensuikan1973/edax-reversi.git

cd edax-reversi || exit
git switch master

mkdir -p data
curl -OL https://github.com/abulmo/edax-reversi/releases/download/v4.4/eval.7z
7z x eval.7z -y

mkdir -p bin
cd src || exit
$edax_build_command

cd ../bin || exit
chmod +x "$edax_bin_name"

cd ../../
rm -rf "$dst"
mkdir -p "$dst"

cp resources/edax.ini "$dst/edax.ini"
cp resources/learning_list.txt "$dst/learning_list.txt"
cp -r edax-reversi/bin "$dst/bin"
cp -r edax-reversi/data "$dst/data"
