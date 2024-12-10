#!/bin/bash

# Use the port provided by Render (default to 10000 if not set)
PORT=${PORT:-10000}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start Keycloak with the correct binding
exec /opt/keycloak/bin/kc.sh start \
    --http-port=$PORT \
    --hostname=0.0.0.0 \
    --hostname-strict=false \
    --http-enabled=true \
    --cache=local \
    --log-level=DEBUG \
    --verbose
