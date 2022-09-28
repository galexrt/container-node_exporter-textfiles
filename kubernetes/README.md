# kubernetes

## Recommendation

It is recommended to use [the `node-exporter-textfiles` Helm chart](../charts/node-exporter-textfiles/) to install and update the node_exporter textfile container.

## Info

This example DaemonSet runs the `smartmon.sh` and `nvme_metrics.sh` node_exporter textfile scripts.
The data is exported to `/var/lib/node_exporter` on the nodes.
