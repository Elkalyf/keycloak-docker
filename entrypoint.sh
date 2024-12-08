#!/bin/bash

# Use Render's PORT variable, defaulting to 8080
PORT=${PORT:-8080}

# Start Keycloak in production mode
exec /opt/keycloak/bin/kc.sh start --optimized \
  --http-port=$PORT \
  --hostname=https://keycloak-docker-rxfn.onrender.com \
  --hostname-strict=false \
  --https-protocols=TLSv1.2
