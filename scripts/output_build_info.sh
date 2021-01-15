# $1: dst
# $2: compiler

dst_file="$1/env.txt"

touch $dst_file

echo "=== os image ===" >> $dst_file
echo $ImageOS >> $dst_file
echo ""

echo "=== github sha ===" >> $dst_file
echo $GITHUB_SHA >> $dst_file
echo ""

echo "=== dart version ===" >> $dst_file
dart --version >> $dst_file 2>&1
echo ""

echo "=== $2 version ===" >> $dst_file
$2 --version >> $dst_file

echo "=== edax-reversi sha ===" >> $dst_file
cd edax-reversi
git rev-parse HEAD >> ../$dst_file
