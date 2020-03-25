##### BEGIN image/Dockerfile/image-header #####
FROM $CONTECO_REGISTRY$CONTECO_REALM_RUNTIME/$CONTECO_ECOSYSTEM_RUNTIME.$CONTECO_BASE AS base
USER root
##### END image/Dockerfile/image-header #####

##### BEGIN image/Dockerfile/conteco #####
COPY ./conteco/ /conteco/
RUN rm -rf /conteco/repo
COPY ./ /conteco/repo/
RUN chmod -R 555 /conteco
##### END image/Dockerfile/conteco #####

##### BEGIN image/Dockerfile/build-instructions #####
COPY ./conteco/configs/usr/share/metricbeat/metricbeat.yml /usr/share/metricbeat/metricbeat.yml
USER metricbeat
##### END image/Dockerfile/build-instructions #####

##### BEGIN image/Dockerfile/env-labels-footer #####
ENV CONTECO_NAME="$CONTECO_NAME" \
    CONTECO_TAG="$CONTECO_TAG" \
    CONTECO_BASE="$CONTECO_BASE" \
    CONTECO_BUILD="$CONTECO_BUILD"
LABEL $CONTECO_LABELSPACE.name="$CONTECO_NAME" \
      $CONTECO_LABELSPACE.tag="$CONTECO_TAG" \
      $CONTECO_LABELSPACE.base="$CONTECO_BASE" \
      $CONTECO_LABELSPACE.build="$CONTECO_BUILD" \
      $CONTECO_LABELSPACE.label="$CONTECO_LABEL" \
      $CONTECO_LABELSPACE.description="$CONTECO_DESCRIPTION" \
      $CONTECO_LABELSPACE.docker.cmd.help="docker run ${CONTECO_REALM_RUNTIME}/${CONTECO_ECOSYSTEM_RUNTIME}.${CONTECO_TYPE}.${CONTECO_NAME} --help" 
##### END image/Dockerfile/env-labels-footer #####
