#!/bin/bash

# Use Render's PORT variable, defaulting to 10000
PORT=${PORT:-10000}

# Start Keycloak with PostgreSQL
exec /opt/keycloak/bin/kc.sh start-dev \
  --verbose \
  --http-port=$PORT \
  --hostname=keycloak-docker-rxfn.onrender.com \
  --hostname-strict=false \
  -Djboss.bind.address=0.0.0.0 \
  --db=postgres \
  --db-url=${db_url} \
  --db-username=${db_username} \
  --db-password=${db_password}
