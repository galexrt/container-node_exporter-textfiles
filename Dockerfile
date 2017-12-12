FROM debian:

MAINTAINER Alexander Trost <galexrt@googlemailc.om>

RUN apt-get -q update && \
    apt-get install -y smartmontools

COPY smartmon.sh /smartmon.sh
COPY entrypoint.sh /entrypoint.sh

VOLUME ["/var/lib/node_exporter"]

ENTRYPOINT ["/entrypoint.sh"]
