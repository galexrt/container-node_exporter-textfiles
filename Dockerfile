FROM debian:jessie

MAINTAINER Alexander Trost <galexrt@googlemailc.om>

RUN apt-get -q update && \
    apt-get install -y --no-install-recommends smartmontools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY smartmon.sh /smartmon.sh
COPY entrypoint.sh /entrypoint.sh

VOLUME ["/var/lib/node_exporter"]

ENTRYPOINT ["/entrypoint.sh"]
