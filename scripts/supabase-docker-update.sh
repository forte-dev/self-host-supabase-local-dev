#!/bin/bash

# Target directory
TARGET_DIR="./deploy/supabase"
mkdir -p $TARGET_DIR  # Ensure the target directory exists

# Base URL for raw files
BASE_URL="https://raw.githubusercontent.com/supabase/supabase/master/docker"

# An array of relative file paths
declare -a files=(
    "dev/data.sql"
    "dev/docker-compose.dev.yml"
    "volumes/api/kong.yml"
    "volumes/db/init/data.sql"
    "volumes/db/jwt.sql"
    "volumes/db/logs.sql"
    "volumes/db/realtime.sql"
    "volumes/db/roles.sql"
    "volumes/db/webhooks.sql"
    "volumes/functions/hello/index.ts"
    "volumes/functions/main/index.ts"
    "volumes/logs/vector.yml"
    "docker-compose.s3.yml"
    "docker-compose.yml"
)

# Loop through the array, downloading each file
for file in "${files[@]}"; do
    # Create the directory structure in the target directory
    mkdir -p "$TARGET_DIR/$(dirname $file)"

    # Construct the full local path for the file
    local_path="$TARGET_DIR/$file"

    echo "Downloading $file to $local_path..."
    curl -o "$local_path" "$BASE_URL/$file"
done

echo "All files have been downloaded successfully to $TARGET_DIR."
