#!/bin/bash

read -p "Enter directory: " dir
dir="${dir/#\~/$HOME}"

# Safety checks
if [ ! -d "$dir" ]; then
    echo "Error: Directory doesn't exist!" >&2
    exit 1
fi

cd "$dir" || exit 1

count=1
for file in *.jpg; do
    # Skip if no files found
    [ -e "$file" ] || continue
    
    # Dry run first - just show what would happen
    echo "Would rename: $file → bg$count.jpg"
    
    # Uncomment to actually rename after verifying
     mv "$file" "bg$count.jpg"
    
    ((count++))
done
touch "$dir/number.txt"
echo "$(( $(ls -l $dir | wc -l) - 2))" > "$dir/number.txt"
