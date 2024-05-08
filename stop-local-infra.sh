#!/bin/bash

# .env file at the root
ENV_FILE="${PWD}/.env"

# Navigate to the directory local ingress directory and start it
cd ./deploy/local-ingress  && docker compose -f docker-compose.yml --env-file "$ENV_FILE" down --rmi local --volumes --remove-orphans -t 1 && cd - || exit

# Navigate to the directory supabase directory and start it
cd ./deploy/supabase  && docker compose -f docker-compose.yml --env-file "$ENV_FILE" down --rmi local --volumes --remove-orphans -t 1 && cd - || exit

# Destroy supabase network
docker network rm supabase
