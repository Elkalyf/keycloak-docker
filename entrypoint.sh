#!/bin/bash

# Use Render's PORT variable (default to 10000 if not set)
PORT=${PORT:-10000}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start the Keycloak server in development mode
exec /opt/keycloak/bin/kc.sh start-dev \
    --http-port=$PORT \
    --hostname=${RENDER_EXTERNAL_HOSTNAME:-localhost} \
    --hostname-strict=false \
    --verbose
