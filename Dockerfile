# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:latest

# Expose the default Keycloak port
EXPOSE 8080

# Set Keycloak admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Add entrypoint script with executable permissions
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


COPY tls/cert.pem /opt/keycloak/conf/tls.crt
COPY tls/key.pem /opt/keycloak/conf/tls.key

