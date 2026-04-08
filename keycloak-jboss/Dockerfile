FROM quay.io/keycloak/keycloak:24.0.3

ARG SOURCE
ARG COMMIT_HASH
ARG COMMIT_ID
ARG BUILD_TIME

LABEL source=${SOURCE}
LABEL commit_hash=${COMMIT_HASH}
LABEL commit_id=${COMMIT_ID}
LABEL build_time=${BUILD_TIME}

ADD --chown=keycloak:keycloak ./theme/ ./theme

RUN mkdir -p /opt/keycloak/themes && \
    cp -R ./theme/mosip /opt/keycloak/themes/mosip && \
    cp -R ./theme/base /opt/keycloak/themes/base

ADD --chown=keycloak:keycloak ./standalone/ ./standalone

RUN mkdir -p /opt/keycloak/providers && \
    cp -R ./standalone/deployments/* /opt/keycloak/providers/

RUN /opt/keycloak/bin/kc.sh build

# #FROM jboss/keycloak:9.0.0
# FROM quay.io/keycloak/keycloak:24.0.3

# ARG SOURCE
# ARG COMMIT_HASH
# ARG COMMIT_ID
# ARG BUILD_TIME
# LABEL source=${SOURCE}
# LABEL commit_hash=${COMMIT_HASH}
# LABEL commit_id=${COMMIT_ID}
# LABEL build_time=${BUILD_TIME}


# ADD --chown=jboss:root ./theme/ ./theme

# RUN cp -R ./theme/mosip /opt/jboss/keycloak/themes/mosip

# RUN cp -R ./theme/base /opt/jboss/keycloak/themes


# ADD --chown=jboss:root ./standalone/ ./standalone

# RUN cp -R ./standalone/deployments/* /opt/jboss/keycloak/standalone/deployments

