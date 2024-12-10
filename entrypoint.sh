#!/bin/bash

# Use Render's PORT variable (default to 10000 if not set)
PORT=${PORT:-10000}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start the Keycloak server
exec /opt/keycloak/bin/kc.sh start \
    --http-port=$PORT \
    --hostname=${RENDER_EXTERNAL_HOSTNAME:-localhost} \
    --hostname-strict=false \
    --http-enabled=true \
    --proxy=edge \
    --verbose \
    --bind-address=0.0.0.0
