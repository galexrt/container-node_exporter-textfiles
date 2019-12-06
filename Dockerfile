FROM debian:buster-slim

LABEL maintainer="Alexander Trost <galexrt@googlemail.com>"

RUN apt-get -q update && \
    apt-get install -y --no-install-recommends smartmontools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint.sh
COPY smartmon.sh /smartmon.sh

RUN chmod 755 /entrypoint.sh /smartmon.sh

VOLUME ["/var/lib/node_exporter"]

ENTRYPOINT ["/entrypoint.sh"]
