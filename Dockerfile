FROM ttbb/base

WORKDIR /opt/sh

ENV LOGSTASH_HOME /opt/sh/logstash

RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-oss-7.6.0.tar.gz && \
    mkdir logstash && \
    tar -xf logstash-oss-7.6.0.tar.gz -C logstash --strip-components 1 && \
    rm -rf logstash-oss-7.6.0.tar.gz && \
    chown -R sh:sh /opt/sh

WORKDIR /opt/sh/logstash
