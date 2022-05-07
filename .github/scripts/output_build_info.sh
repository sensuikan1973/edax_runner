# $1: dst
# $2: compiler

dst_file="$1/env.txt"

touch "$dst_file"

{
  echo "=== edax-runner sha ==="
  echo "$GITHUB_SHA"

  echo "=== os image ==="
  # shellcheck disable=SC2154
  echo "$ImageOS"

  echo "=== dart version ==="
  dart --version 2>&1

  echo "=== gcc version ==="
  gcc --version
} >> "$dst_file"
