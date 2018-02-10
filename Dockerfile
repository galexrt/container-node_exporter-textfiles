FROM debian:stretch-slim

MAINTAINER Alexander Trost <galexrt@googlemailc.om>

RUN apt-get -q update && \
    apt-get install -y --no-install-recommends smartmontools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint.sh
COPY smartmon.sh /smartmon.sh

VOLUME ["/var/lib/node_exporter"]

ENTRYPOINT ["/entrypoint.sh"]
