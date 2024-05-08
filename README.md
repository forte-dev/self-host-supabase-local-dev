# Fully Dockerized Web Stack with Supabase Docker & Traefik + localhost ssl certs

## Introduction

This is a self-hosting Supabase + Traefik with localhost ssl certs.

Note: this setup is unofficial.

It aims at fully automating self-hosted Supabase setup with [Traefik](https://github.com/traefik/traefik) as a reverse proxy for local development.

WIP - Automating deployment to Digital Ocean.

Please make sure you read the [self-hosting guide](https://supabase.io/docs/guides/self-hosting#running-supabase).

## Requirements 

To imitate a deployed environment this implementation leverages `mkcert`to enable local development with https
Please install it using brew:

`brew install mkcert`

## Setup

Please run this command:
`./setup-repo.sh`

## Run

Execute the following command:
`./start-local-infra.sh`

You will be able to access traefik proxy at:
`https://traefik.acme.localhost`
with credentials:
`user:password`

You will be able to access traefik proxy at:
`https://studio.acme.localhost`
with credentials:
`supabase:this_password_is_insecure_and_should_be_updated`

## Stop

Execute the following command:
`./stop-local-infra.sh`

## Existing Commands

`./setup-repo.sh` - Updates Supabase docker files & creates localhost ssl certs using `mkcert`.

`./start-local-infra.sh` - Starts Supabase & Traefik with localhost ssl certs service.

`./stop-local-infra.sh` - Stops Supabase & Traefik service.

`./wipe-supabase-data.sh` - Clears the supabase postgres data and wipes it clean.

### localhost certs generation

> Please note that this step is automated for you when you use `./setup-repo.sh` command.

The local operation of this repo, requires use of `mkcert` to generate local certs.
We leverage brew to install it:
`brew install mkcert`
then inside `cert` folder in order to create cert for acme.test and _.acme.test execute:
`mkcert -key-file key.pem -cert-file cert.pem "acme.localhost" "_.acme.localhost"`
