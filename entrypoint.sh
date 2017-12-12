#!/bin/bash
# Copyright (c) Alexander Trost 2017
# Licensed under MIT license.

INTERVAL="${INTERVAL:-30}"

echo "=> INTERVAL: $INTERVAL"

while true; do
    echo "-> Running smartmon.sh"
    /smartmon.sh > /var/lib/node_exporter/smartmon.prom
    echo "=> smartmon.sh: $?"
    sleep "$INTERVAL"
done
