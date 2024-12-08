#!/bin/bash

# Use Render's PORT variable, defaulting to 8080 if not set
PORT=${PORT:-8080}

# Start Keycloak with HTTPS configuration
exec /opt/keycloak/bin/kc.sh start --optimized \
  --http-port=$PORT \
  --https-port=8443 \
  --https-key-store-file=/opt/keycloak/conf/tls.key \
  --https-key-store-password=password \
  --hostname=https://keycloak-docker-rxfn.onrender.com \
  --hostname-strict=false
