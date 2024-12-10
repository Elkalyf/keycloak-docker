FROM quay.io/keycloak/keycloak:latest

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Add entrypoint script
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh

# Use the custom entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
