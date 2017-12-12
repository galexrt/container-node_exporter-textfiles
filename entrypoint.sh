#!/bin/bash
# Copyright (c) Alexander Trost 2017
# Licensed under MIT license.

INTERVAL="${INTERVAL:-30}"

while true; do
    echo "-> Running smartmon.sh"
    /smartmon.sh > /var/lib/node_exporter/smartmon.prom
    sleep "$INTERVAL"
done
