#!/bin/bash

# Use Render's PORT variable (default to 8443 if not set)
PORT=${PORT:-8443}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start the Keycloak server with proper binding
exec /opt/keycloak/bin/kc.sh start \
    --https-port=$PORT \  # Use `--https-port` instead of `--http-port` if you're focusing on HTTPS
    --hostname=keycloak-docker-rxfn.onrender.com \
    --hostname-strict=false \
    --http-enabled=false \  # Disables HTTP to avoid conflicts with Render's proxy
    --cache=local \
    --spi-cors-allowed-origin-pattern=https://keycloak-docker-rxfn.onrender.com \
    --spi-login-protocol-openid-connect-csp-frame-src-value="'self' https://keycloak-docker-rxfn.onrender.com" \
    --log-level=DEBUG \
    --verbose

