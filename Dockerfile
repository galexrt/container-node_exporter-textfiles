FROM debian:bullseye-slim

ARG BUILD_DATE="N/A"
ARG REVISION="N/A"

LABEL org.opencontainers.image.authors="Alexander Trost <galexrt@googlemail.com>" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.title="galexrt/container-node_exporter-smartmon" \
    org.opencontainers.image.description="Container Image with the Prometheus Community's node-exporter-textfile-collector-scripts Repository checked out, with some utilities installed." \
    org.opencontainers.image.documentation="https://github.com/galexrt/container-node_exporter-smartmon/blob/main/README.md" \
    org.opencontainers.image.url="https://github.com/galexrt/container-node_exporter-smartmon" \
    org.opencontainers.image.source="https://github.com/galexrt/container-node_exporter-smartmon" \
    org.opencontainers.image.revision="${REVISION}" \
    org.opencontainers.image.vendor="galexrt" \
    org.opencontainers.image.version="N/A"

RUN apt-get -q update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        jq \
        moreutils \
        moreutils \
        nvme-cli \
        pciutils \
        smartmontools \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /scripts && \
    git clone --depth 1 --branch master --single-branch \
        https://github.com/prometheus-community/node-exporter-textfile-collector-scripts.git \
        /scripts && \
    chmod 755 /scripts/* && \
    update-pciids -q

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

VOLUME ["/var/lib/node_exporter"]

ENTRYPOINT ["/entrypoint.sh"]
