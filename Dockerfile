FROM debian:bookworm-slim

ARG BUILD_DATE="N/A"
ARG REVISION="N/A"

LABEL org.opencontainers.image.authors="Alexander Trost <galexrt@googlemail.com>" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.title="galexrt/container-node_exporter-textfiles" \
    org.opencontainers.image.description="Container Image with the Prometheus Community's node-exporter-textfile-collector-scripts Repository checked out, with some utilities installed." \
    org.opencontainers.image.documentation="https://github.com/galexrt/container-node_exporter-textfiles/blob/main/README.md" \
    org.opencontainers.image.url="https://github.com/galexrt/container-node_exporter-textfiles" \
    org.opencontainers.image.source="https://github.com/galexrt/container-node_exporter-textfiles" \
    org.opencontainers.image.revision="${REVISION}" \
    org.opencontainers.image.vendor="galexrt" \
    org.opencontainers.image.version="N/A"

RUN apt-get -q update && \
    apt-get -q upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        jq \
        moreutils \
        moreutils \
        nvme-cli \
        pciutils \
        smartmontools \
        wget \
        python3 \
        python3-prometheus-client \
        gpg \
        gpg-agent && \
    mkdir -p /scripts && \
    git clone --depth 1 --branch master --single-branch \
        https://github.com/prometheus-community/node-exporter-textfile-collector-scripts.git \
        /scripts && \
    chmod 755 /scripts/* && \
    /usr/sbin/update-smart-drivedb && \
    apt-get remove -y gpg git gpg-agent && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    update-pciids -q

COPY <<EOF /etc/smart_drivedb.h
  { "USB: ADATA; ",
    "0x125f:0xa(1[135]|21|31|3[57]|68|7[56]|8[35])a", // 0xa11a: Classic CH11 1TB, 0xa13a: NH13 1TB,
    "", // 0xa15a: HD710 1TB, 0xa21a: HV610 (0x4504), 0xa31a: HV620 2TB (0x0100),
    "", // 0xa35a: HD650 2TB (0x6503), 0xa37a: Silverstone MS10 M.2 (0x3103), 0xa75a: HD710P 4TB,
        // 0xa68a: SD600, 0xa76a: ED600 (0x0204), 0xa83a: HD330 (0x0100)
    "-d sat"
  }
EOF

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

VOLUME ["/var/lib/node_exporter"]

ENTRYPOINT ["/entrypoint.sh"]
