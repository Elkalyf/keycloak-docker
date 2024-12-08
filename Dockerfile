# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:latest

# Set admin credentials using environment variables
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=your_password

# Expose the default HTTP port (for local testing)
EXPOSE 8080

# Use Render's dynamic PORT environment variable
CMD ["start-dev", "--http-port=${PORT}", "--hostname=0.0.0.0"]
