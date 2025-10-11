#!/bin/sh
# Copyright (C) 2006-2012 OpenWrt.org
set -e -x
if [ $# -ne 3]; then
    echo "SYNTAX: $0 <file> <efi size> <efi directory>"
    exit 1
fi

OUTPUT="$1"
EFISIZE="$2"
EFIDIR="$3"

rm -f "$OUTPUT"

# Using mcopy -s ... is using READDIR(3) to iterate through the directory
# entries, hence they end up in the FAT filesystem in traversal order which
# breaks reproducibility.
# Implement recursive copy with reproducible order.
dos_dircopy() {
  local entry
  local baseentry
  for entry in "$1"/* ; do
    if [ -f "$entry" ]; then
      mcopy -i "$OUTPUT" "$entry" ::"$2"
    elif [ -d "$entry" ]; then
      baseentry="$(basename "$entry")"
      mmd -i "$OUTPUT" ::"$2""$baseentry"
      dos_dircopy "$entry" "$2""$baseentry"/
    fi
  done
}

mkfs.fat --invariant -F 32 -n efi -C "$OUTPUT" -S 512 "$((EFISIZE * 1024))"
LC_ALL=C dos_dircopy "$EFIDIR" /
