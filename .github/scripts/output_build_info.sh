# $1: dst
# $2: compiler

dst_file="$1/env.txt"
compiler="$2"

touch "$dst_file"

echo "=== edax-reversi sha ===" >> "$dst_file"
cd edax-reversi || exit
git rev-parse HEAD >> "../$dst_file"
cd ..

{
  echo "=== edax-runner sha ==="
  echo "$GITHUB_SHA"

  echo "=== os image ==="
  # shellcheck disable=SC2154
  echo "$ImageOS"

  echo "=== dart version ==="
  dart --version 2>&1

  echo "=== $compiler version ==="
  $compiler --version
} >> "$dst_file"
