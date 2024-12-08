# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:latest

# Expose the default Keycloak port
EXPOSE 8080

# Set Keycloak admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Use the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
