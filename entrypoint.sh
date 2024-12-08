#!/bin/bash

# Use Render's PORT variable, defaulting to 8080 if not set
PORT=${PORT:-8080}

# Start Keycloak with the correct port and hostname configuration
exec /opt/keycloak/bin/kc.sh start-dev \
  --http-port=$PORT \
  --hostname=https://keycloak-docker-rxfn.onrender.com \
  --hostname-strict=false
