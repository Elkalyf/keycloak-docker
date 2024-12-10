#!/bin/bash

PORT=${PORT:-10000}

/opt/keycloak/bin/kc.sh build

exec /opt/keycloak/bin/kc.sh start \
    --http-port=$PORT \
    --hostname=${RENDER_EXTERNAL_HOSTNAME:-localhost} \
    --hostname-strict=false \
    --http-enabled=true \
    --verbose
