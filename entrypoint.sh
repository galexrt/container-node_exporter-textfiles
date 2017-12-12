#!/bin/bash
# Copyright (c) Alexander Trost 2017
# Licensed under MIT license.

if [ ! -z "$DEBUG" ]; then
    set -ex
fi


INTERVAL="${INTERVAL:-30}"

echo "Starting smartmon.sh loop ..."
while true; do
    /smartmon.sh > /var/lib/node_exporter/smartmon.prom
    sleep "$INTERVAL"
done
