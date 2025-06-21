#!/bin/bash

cd ~/devops-apps || { echo "Directory not found"; exit 1; }

APP_LIST=()

find categories -mindepth 2 -maxdepth 2 -type d | sort | while read dir; do
    APP_NAME=$(basename "$dir")
    DESC_FILE="$dir/description.txt"
    DESCRIPTION=$(cat "$DESC_FILE" 2>/dev/null | head -n 1)

    echo "Found app: $APP_NAME -> $DESCRIPTION"

    APP_LIST+=("$APP_NAME" "$DESCRIPTION")
done

echo "Final array count: ${#APP_LIST[@]}"
