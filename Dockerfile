FROM quay.io/keycloak/keycloak:latest

# Expose the default Keycloak port
EXPOSE 8080

# Set Keycloak admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Start Keycloak in development mode
CMD ["start-dev"]
