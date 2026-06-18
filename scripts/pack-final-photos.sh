#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <final-photo-folder> <output.zip>" >&2
  exit 2
fi

src_dir="$1"
zip_path="$2"

if [[ ! -d "$src_dir" ]]; then
  echo "Final photo folder does not exist: $src_dir" >&2
  exit 1
fi

count="$(find "$src_dir" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | wc -l | tr -d ' ')"
if [[ "$count" == "0" ]]; then
  echo "No final image files found in: $src_dir" >&2
  exit 1
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

find "$src_dir" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) -print0 \
  | sort -z \
  | while IFS= read -r -d '' file; do
      cp "$file" "$tmp_dir/$(basename "$file")"
    done

rm -f "$zip_path"
(cd "$tmp_dir" && zip -X -q -r "$zip_path" .)

echo "Packed $count final photos into $zip_path"
