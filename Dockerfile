FROM quay.io/keycloak/keycloak:latest

# Set up Keycloak with admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Expose Keycloak port
EXPOSE 8080

# Use development mode (HTTPS is disabled, for simplicity)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080"]
