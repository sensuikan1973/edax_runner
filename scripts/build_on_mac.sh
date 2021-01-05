git clone --depth 1 https://github.com/abulmo/edax-reversi.git

cd edax-reversi
mkdir -p data
curl -OL https://github.com/abulmo/edax-reversi/releases/download/v4.4/eval.7z
7z x eval.7z -y

mkdir -p bin
cd src
make build ARCH=x64-modern COMP=gcc OS=osx
cd ..
chmod +x bin/mEdax

cd ../
rm -rf build
mkdir -p build

cp edax.ini build/edax.ini
cp -r edax-reversi/bin build/bin
cp -r edax-reversi/data build/data
dart2native bin/edax_runner.dart -v -o build/edax_runner-mac
