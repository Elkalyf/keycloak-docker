#!/bin/bash

# Use Render's PORT variable, defaulting to 8080 if not set
PORT=${PORT:-8080}

# Start Keycloak in development mode with the correct configurations
exec /opt/keycloak/bin/kc.sh start-dev \
  --http-port=$PORT \
  --hostname=keycloak-docker-rxfn.onrender.com \
  --hostname-strict=false \
  --hostname-strict-https=false \
  --http-relative-path=/ \
  -Djboss.bind.address=0.0.0.0





