FROM quay.io/keycloak/keycloak:24.0

USER root

ARG SOURCE
ARG COMMIT_HASH
ARG COMMIT_ID
ARG BUILD_TIME

LABEL source=${SOURCE}
LABEL commit_hash=${COMMIT_HASH}
LABEL commit_id=${COMMIT_ID}
LABEL build_time=${BUILD_TIME}
LABEL maintainer="Migrated from Bitnami"

RUN microdnf install -y \
    acl ca-certificates curl gzip tar procps rsync \
    && microdnf clean all

COPY prebuildfs /
COPY rootfs /

ENV KC_HOME=/opt/keycloak

COPY ./theme/base ${KC_HOME}/themes/base
COPY ./theme/mosip ${KC_HOME}/themes/mosip

COPY ./standalone/deployments/* ${KC_HOME}/providers/

RUN chown -R 1000:0 ${KC_HOME} && chmod -R g+rwX ${KC_HOME}

USER 1000

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]

# #FROM docker.io/bitnami/keycloak:16.1.1
# FROM quay.io/keycloak/keycloak:15.0.2-legacy

# USER root

# ARG SOURCE
# ARG COMMIT_HASH
# ARG COMMIT_ID
# ARG BUILD_TIME
# LABEL source=${SOURCE}
# LABEL commit_hash=${COMMIT_HASH}
# LABEL commit_id=${COMMIT_ID}
# LABEL build_time=${BUILD_TIME}

# LABEL maintainer="Bitnami <containers@bitnami.com>"

# COPY prebuildfs /

# COPY ./theme/base /opt/bitnami/keycloak/themes/base

# COPY ./theme/mosip /opt/bitnami/keycloak/themes/mosip

# COPY ./standalone/deployments/* /opt/bitnami/keycloak/standalone/deployments

# COPY rootfs /

# RUN chmod +x /usr/sbin/install_packages && chmod g+rwX /opt/bitnami && \
#     chmod +x /opt/bitnami/scripts/keycloak/entrypoint.sh /opt/bitnami/scripts/keycloak/setup.sh /opt/bitnami/scripts/keycloak/run.sh && \
#     chown -R 1001:1001 /opt/*

# # Install required system packages and dependencies
# RUN . /usr/sbin/install_packages acl ca-certificates curl gzip libaio1 libc6 procps rsync tar zlib1g

# USER 1001

# ENTRYPOINT [ "/opt/bitnami/scripts/keycloak/entrypoint.sh" ]

# CMD [ "/opt/bitnami/scripts/keycloak/run.sh" ]
