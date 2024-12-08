# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:latest
ADD https://jdbc.postgresql.org/download/postgresql-42.5.0.jar /opt/keycloak/providers/
USER keycloak

# Expose the default Keycloak port
EXPOSE 8443


# Set Keycloak admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin


# Add entrypoint script with executable permissions
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]



