# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:21.1.1

# Set admin credentials
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=your_password

# Expose default port (for local testing)
EXPOSE 8080

# Add entrypoint script to a writable directory
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Ensure the script is executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
