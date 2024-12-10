#!/bin/bash

# Use Render's PORT variable (default to 10000 if not set)
PORT=${PORT:-10000}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start the Keycloak server with proper binding
exec /opt/keycloak/bin/kc.sh start \
    --http-port=$PORT \  # Bind to the PORT variable
    --hostname=${RENDER_EXTERNAL_HOSTNAME:-localhost} \  # Render's external hostname
    --hostname-strict=false \
    --http-enabled=true \  # Ensure HTTP is enabled for Render
    --spi-cors-allowed-origin-pattern="https://${RENDER_EXTERNAL_HOSTNAME}" \
    --spi-login-protocol-openid-connect-csp-frame-src-value="'self' https://${RENDER_EXTERNAL_HOSTNAME}" \
    --cache=local \
    --log-level=DEBUG \
    --verbose


