# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:latest

# Set admin credentials
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=your_password

# Expose default port (for local testing)
EXPOSE 8080

# Add entrypoint script
COPY entrypoint.sh /opt/keycloak/entrypoint.sh
RUN chmod +x /opt/keycloak/entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/opt/keycloak/entrypoint.sh"]
