#!/bin/bash

# Navigate to the directory local ingress directory and start it
cd ./deploy/local-ingress/cert  && mkcert -key-file key.pem -cert-file cert.pem "acme.localhost" "*.acme.localhost" && cd - || exit
