#!/bin/bash

# Use Render's PORT variable (default to 10000 if not set)
PORT=${PORT:-10000}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start the Keycloak server
exec /opt/keycloak/bin/kc.sh start \
    --http-port=$PORT \
    --hostname=keycloak-docker-rxfm.onrender.com \
    --hostname-strict=false \
    --http-enabled=true \
    --spi-hostname-default=0.0.0.0 \
    --spi-cors-allowed-origin-pattern=https://keycloak-docker-rxfm.onrender.com \
    --log-level=DEBUG \
    --cache=local \
    --verbose
