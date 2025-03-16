#!/bin/bash

SOURCE="$1"
TARGET="$2"
output="output_"$(date)".txt"

if [ ! -d "$SOURCE" ]; then
    echo "Not a directory"
    exit 1
fi

if [ ! -d "$TARGET" ]; then
    echo "Not a directory"
    exit 1
fi

# source_dirs=()
# target_dirs=()
# num_dirs=0

ne_dirs=()

for sub_dir in "$SOURCE"/*/; do
    if [ -d "$sub_dir" ]; then
        folder="$(basename "$sub_dir")"
        source_count=$(ls -1 "$sub_dir" | wc -l)
        path=""$TARGET"/"$folder"/"
        target_count=$(ls -1 "$path" | wc -l)

        if [ $source_count -ne $target_count ]; then
            ne_dirs+=("$folder")
        fi
    fi
done

for dirs in "${ne_dirs[@]}"; do
    source_path=""$SOURCE"/"$dirs""
    # echo "##### "$dirs" #####" >> "$output"
    for file in "$source_path"/*; do
        name=$(basename "$file")
        target_file=""$TARGET"/"$dirs"/"$name""
        if [ ! -e "$target_file" ]; then
            # echo ""$target_file" does not exist" >> "$output"
            source_file=""$source_path"/"$name""
            target_path=""$TARGET"/"$dirs""
            cp -r "$source_file" "$target_path"
        fi
    done
    # echo >> "$output"
done

# for sub_dir in "$TARGET"/*/; do
#     if [ -d "$sub_dir" ]; then
#         # (( num_dirs++ ))
#         target_dirs+=("$sub_dir")
#     fi
# done

# for dir in "${directories[@]}"; do
#     echo -n ""$(basename "$dir")": " >> "$output"
#     ls -1 "$dir" | wc -l >> "$output"
#     # echo
# done

# echo "$num_dirs"


