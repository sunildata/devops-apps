#!/bin/bash

cd ~/devops-apps || exit

echo "Listing all apps..."
find categories -mindepth 2 -maxdepth 2 -type d | while read dir; do
    name=$(basename "$dir")
    desc=$(cat "$dir/description.txt" 2>/dev/null)
    echo "- $name: $desc"
done
