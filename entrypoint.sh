#!/bin/bash

# Use Render's PORT variable, defaulting to 10000
PORT=${PORT:-10000}

# Set H2 database URL to prevent unexpected shutdown
export KC_DB_URL=jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE

# Start Keycloak
exec /opt/keycloak/bin/kc.sh start-dev \
  --http-port=$PORT \
  --hostname=keycloak-docker-rxfn.onrender.com \
  --hostname-strict=false \
  -Djboss.bind.address=0.0.0.0
