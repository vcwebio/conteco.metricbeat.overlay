##### BEGIN image/Dockerfile/image-header #####
FROM vcwebio/conteco.metricbeat.base AS base
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
ENV CONTECO_NAME="overlay" \
    CONTECO_TAG="7.1.1" \
    CONTECO_BASE="metricbeat.base" \
    CONTECO_BUILD="image"
LABEL io.vcweb.name="overlay" \
      io.vcweb.tag="7.1.1" \
      io.vcweb.base="metricbeat.base" \
      io.vcweb.build="image" \
      io.vcweb.label="metricbeat.overlay - ConteEco" \
      io.vcweb.description="The ElasticSearch Metricbeat base image configured for service monitoring." \
      io.vcweb.docker.cmd.help="docker run vcwebio/conteco.metricbeat.overlay --help" 
##### END image/Dockerfile/env-labels-footer #####
