#!/usr/bin/env bash

# Copyright (c) Alexander Trost 2020
# Licensed under MIT license.

if [ -n "$DEBUG" ]; then
    set -ex
fi

SCRIPT="${SCRIPT:-smartmon.sh}"
OUTPUT_FILENAME="${OUTPUT_FILENAME:-smartmon}"
INTERVAL="${INTERVAL:-300}"

if [ ! -f "/scripts/${SCRIPT}" ]; then
    echo "Script ${SCRIPT} doesn't exist. Exiting 1"
    exit 1
fi

echo "Starting smartmon.sh loop ..."
while true; do
    "/scripts/${SCRIPT}" "${@}" > "/var/lib/node_exporter/${OUTPUT_FILENAME}.prom"
    sleep "${INTERVAL}"
done
