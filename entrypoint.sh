#!/bin/bash

# Use Render's PORT variable, defaulting to 10000
PORT=${PORT:-10000}

# Set Keycloak server options
export JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Dkeycloak.profile.feature.upload_scripts=enabled"

# Start the Keycloak server with HTTPS enabled
exec /opt/keycloak/bin/kc.sh start \
    --http-port=8080 \
    --https-port=$PORT \
    --https-certificate-file=/etc/x509/https/cert.pem \
    --https-certificate-key-file=/etc/x509/https/key.pem \
    --hostname=keycloak-docker-rxfn.onrender.com \
    --hostname-strict=false \
    --verbose
    --log-level=DEBUG
