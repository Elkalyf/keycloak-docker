FROM quay.io/keycloak/keycloak:latest

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Default port for Keycloak
EXPOSE 10000

# Add entrypoint script
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh

# Use the custom entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Add a health check to verify Keycloak is running
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
  CMD curl --fail http://localhost:10000/auth || exit 1
