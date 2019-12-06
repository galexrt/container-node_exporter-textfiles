#!/usr/bin/env bash

# Copyright (c) Alexander Trost 2019
# Licensed under MIT license.

if [ ! -z "$DEBUG" ]; then
    set -ex
fi

INTERVAL="${INTERVAL:-300}"

echo "Starting smartmon.sh loop ..."
while true; do
    /smartmon.sh > /var/lib/node_exporter/smartmon.prom
    sleep "$INTERVAL"
done
