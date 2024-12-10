#!/bin/bash

# Use Render's PORT variable (default to 10000 if not set)
PORT=${PORT:-10000}

# Use Render's external hostname if available, otherwise fallback to '0.0.0.0'
HOSTNAME=${RENDER_EXTERNAL_HOSTNAME:-0.0.0.0}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start the Keycloak server with proper binding
exec /opt/keycloak/bin/kc.sh start \
    --http-port=$PORT \
    --hostname=$HOSTNAME \
    --hostname-strict=false \
    --http-enabled=true \
    --cache=local \
    --spi-hostname-default=0.0.0.0 \
    --spi-hostname-strict-backchannel=false \
    --verbose
