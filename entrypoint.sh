#!/bin/bash

# Use the port provided by the environment or default to 10000
PORT=${PORT:-10000}

# Set Keycloak environment variables
export JAVA_OPTS="-Dquarkus.http.host=0.0.0.0 -Dquarkus.http.port=${PORT}"

# Start Keycloak
exec /opt/keycloak/bin/kc.sh start \
    --http-port=${PORT} \
    --https-port=8443 \
    --https-certificate-file=/ssl/cert.pem \
    --https-certificate-key-file=/ssl/key.pem \
    --hostname-strict=false \
    --http-enabled=true \
    --cache=local \
    --log-level=DEBUG
