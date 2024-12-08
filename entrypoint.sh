#!/bin/bash

# Default to 8080 if PORT is not set
PORT=${PORT:-8080}

# Start Keycloak
exec /opt/keycloak/bin/kc.sh start-dev --http-port=$PORT --hostname=0.0.0.0
