#!/bin/bash

# Use Render's PORT variable (default to 10000 if not set)
PORT=${PORT:-10000}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start the Keycloak server with proper binding
exec /opt/keycloak/bin/kc.sh start \
    --http-port=$PORT \
    --hostname=keycloak-docker-rxfn.onrender.com \
    --hostname-strict=false \
    --http-enabled=true \
    --cache=local \
    --spi-cors-allowed-origin-pattern=https://keycloak-docker-rxfn.onrender.com \
    --spi-login-protocol-openid-connect-csp-frame-src-value="'self' https://keycloak-docker-rxfn.onrender.com" \
    --log-level=DEBUG \
    --verbose
