# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:latest

# Add PostgreSQL JDBC driver
ADD https://jdbc.postgresql.org/download/postgresql-42.5.0.jar /opt/keycloak/providers/

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Add entrypoint script
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh

# Expose default Keycloak ports
EXPOSE 8080
EXPOSE 8443

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


