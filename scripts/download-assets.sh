#!/usr/bin/env sh

set -eu

OWNER="${OWNER:-devv-jr}"
REPO="${REPO:-arkyn-nova}"
BRANCH="${BRANCH:-main}"
DEST_DIR="${1:-assets/arkyn-linux}"
BASE_URL="${BASE_URL:-https://raw.githubusercontent.com/${OWNER}/${REPO}/${BRANCH}/assets/arkyn-linux}"

FILES="arkyn-god.png arkyn1.png arkyn2.jpg arkyn3.png arkyn4.png"

mkdir -p "$DEST_DIR"

for file in $FILES; do
  printf 'Downloading %s...\n' "$file"
  curl -fsSL "$BASE_URL/$file" -o "$DEST_DIR/$file"
done

printf 'Done. Files saved in %s\n' "$DEST_DIR"