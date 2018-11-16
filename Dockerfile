
ARG IMAGE_ARG_IMAGE_PREFIX

FROM ${IMAGE_ARG_IMAGE_PREFIX:-cirepo/}sonarqube-plugins:6.7.5-alpine as plugins

#FROM sonarqube:7.1-alpine
FROM sonarqube:6.7.5-alpine

COPY --from=plugins /opt/sonarqube/extensions/plugins /opt/sonarqube/extensions/plugins
