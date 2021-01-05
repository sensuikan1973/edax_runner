git clone --depth 1 https://github.com/abulmo/edax-reversi.git edax

cd edax
mkdir -p data
curl -OL https://github.com/abulmo/edax-reversi/releases/download/v4.4/eval.7z
7z x eval.7z -y

mkdir -p bin
cd src
make build ARCH=x64-modern COMP=gcc OS=osx
cd ..
chmod +x bin/mEdax

cd ../
cp edax.ini build/edax.ini
cp -r edax/bin build/bin
cp -r edax/data build/data

mkdir -p build
dart2native bin/edax_runner.dart -v -o build/edax_runner-mac
