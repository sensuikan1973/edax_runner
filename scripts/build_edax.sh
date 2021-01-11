# NOTE: require some environment variables.
# bin_name (e.g. edax_runner-mac)
# edax_build_command (e.g. make build ARCH=x64-modern COMP=gcc OS=osx)
# edax_bin_name (e.g. mEdax)
# dst: (e.g. build)

git clone --depth 1 https://github.com/abulmo/edax-reversi.git
git checkout eb519a7c1d7d085577448bcb1e9b38ba5c1fa970

cd edax-reversi
mkdir -p data
curl -OL https://github.com/abulmo/edax-reversi/releases/download/v4.4/eval.7z
7z x eval.7z -y

mkdir -p bin
cd src
$edax_build_command
# doxygen # big document. too heavy.

cd ../bin
chmod +x $edax_bin_name

cd ../../
rm -rf $dst
mkdir -p $dst

cp resources/edax.ini $dst/edax.ini
cp resources/learning_list.txt $dst/learning_list.txt
cp -r edax-reversi/bin $dst/bin
cp -r edax-reversi/data $dst/data
# cp -r edax-reversi/doc/html $dst/doc/html
