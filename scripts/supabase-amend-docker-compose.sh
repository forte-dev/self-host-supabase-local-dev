#!/bin/bash

# Path to the docker-compose.yml file
file_path="deploy/supabase/docker-compose.yml"

# Services to update with the network configuration
services=("studio" "kong" "auth" "rest" "realtime" "storage" "imgproxy" "meta" "functions" "analytics" "db" "vector")

# Loop over each service and insert the network configuration
for service in "${services[@]}"; do
  sed -i '' -e "/^  $service:/s/$/\\
    networks:\
      \\n      - supabase/" "$file_path"
done

# Add global network configuration at the end of the file
echo -e "\nnetworks:\n  supabase:\n    driver: bridge\n    external: true" >> "$file_path"
