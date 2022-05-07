#!/bin/bash
set -uxo pipefail

dst="build"
edax_runner_bin_name=$1
libedax_shared_library_name=$2

rm -rf "$dst"
mkdir -p "$dst/data"

dart compile exe bin/edax_runner.dart -o "$dst/$edax_runner_bin_name"

cp -r "resources/dll/$libedax_shared_library_name" "$dst/$libedax_shared_library_name"
cp resources/data/*.dat "$dst/data"
cp resources/edax.ini "$dst/edax.ini"
cp resources/learning_list.txt "$dst/learning_list.txt"
