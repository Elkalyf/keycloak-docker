#!/bin/bash

# Use Render's PORT variable, defaulting to 10000
PORT=${PORT:-10000}

# Build the Keycloak server
/opt/keycloak/bin/kc.sh build

# Start the Keycloak server
exec /opt/keycloak/bin/kc.sh start \
     --http-port=$PORT \
     --hostname=keycloak-docker-rxfm.onrender.com \
     --hostname-strict=false \
     --http-enabled=true \
     --verbose


  
