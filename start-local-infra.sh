#!/bin/bash

# .env file at the root
ENV_FILE="${PWD}/.env"

# Create supabase network
docker network create supabase

# Navigate to the directory local ingress directory and start it
cd ./deploy/local-ingress  && docker compose -f docker-compose.yml --env-file "$ENV_FILE" up --build --force-recreate -d --renew-anon-volumes && cd - || exit

# Navigate to the directory supabase directory and start it
cd ./deploy/supabase  && docker compose -f docker-compose.yml --env-file "$ENV_FILE" up --build --force-recreate -d --renew-anon-volumes && cd - || exit
