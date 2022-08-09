FROM ttbb/base

WORKDIR /opt/sh

ENV LOGSTASH_HOME /opt/sh/logstash

ARG TARGETARCH

ARG amd_download=7.17.5-linux-x86_64

ARG arm_download=7.17.5-linux-aarch64

RUN if [[ "$TARGETARCH" = "amd64" ]]; \
    then download=$amd_download; \
    else download=$arm_download; \
    fi && \
    wget https://artifacts.elastic.co/downloads/logstash/logstash-$download.tar.gz && \
    mkdir logstash && \
    tar -xf logstash-$download.tar.gz -C logstash --strip-components 1 && \
    rm -rf logstash-$download.tar.gz && \
    chown -R sh:sh /opt/sh

WORKDIR /opt/sh/logstash
