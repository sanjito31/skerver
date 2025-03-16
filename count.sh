#!/bin/bash

DIR="$1"

if [ ! -d "$DIR" ]; then
    echo "Not a directory"
    exit 1
fi

directories=()
counts=()
num_dirs=0

for sub_dir in "$DIR"/*/; do
    if [ -d "$sub_dir" ]; then
        (( num_dirs++ ))
        directories+=("$sub_dir")
    fi
done

for dir in "${directories[@]}"; do
    echo -n ""$(basename "$dir")": "
    ls -1 "$dir" | wc -l
    # echo
done

# echo "$num_dirs"


