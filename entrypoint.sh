#!/bin/bash

# Use Render's PORT variable, defaulting to 8080
PORT=${PORT:-8080}

# Start Keycloak with H2 database
exec /opt/keycloak/bin/kc.sh start-dev
  --http-port=${PORT} \
  --hostname=keycloak-docker-rxfm.onrender.com \
  --hostname-strict=false \
  -Djboss.bind.address=0.0.0.0 \
  --verbose
