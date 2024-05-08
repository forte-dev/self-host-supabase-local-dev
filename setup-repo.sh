#!/bin/bash

cp .env.example .env
cp ./deploy/local-ingress/traefik/htpasswd.example ./deploy/local-ingress/traefik/htpasswd

./scripts/create-local-certs.sh
./scripts/supabase-docker-update.sh
./scripts/supabase-amend-docker-compose.sh
