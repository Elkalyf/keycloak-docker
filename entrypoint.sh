#!/bin/bash

# Use Render's PORT variable, defaulting to 8080
PORT=${PORT:-10000}

# Start Keycloak with H2 database
exec /opt/keycloak/bin/kc.sh start \
     --http-port=${PORT} \
     --hostname=keycloak-docker-rxfm.onrender.com \
     --hostname-strict=false \
     --http-enabled=true \
     --proxy-headers=xforwarded \
     --verbose \
     --optimized


  
