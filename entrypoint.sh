#!/bin/bash

# Use the port provided by Render or default to 10000
PORT=${PORT:-10000}

# Set Keycloak environment variables
export JAVA_OPTS="-Dquarkus.http.host=0.0.0.0 -Dquarkus.http.port=${PORT}"

# Start Keycloak with the correct options
exec /opt/keycloak/bin/kc.sh start \
    --http-port=${PORT} \
    --hostname-strict=false \
    --http-enabled=true \
    --cache=local \
    --log-level=DEBUG
