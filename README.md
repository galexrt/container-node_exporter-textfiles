# docker-node_exporter-smartmon

This Docker image needs to be run in privileged mode.

Image available from Quay.io and Docker Hub:
* `quay.io/galexrt/node-exporter-smartmon:TAG`
* `galexrt/node-exporter-smartmon:TAG`

## Credits

The `smartmon.sh` has been taken from the [prometheus-community/node-exporter-textfile-collector-scripts](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts) ([prometheus/node_exporter](https://github.com/prometheus/node_exporter)) repository.

## Grafana Dashboard

A dashboard for viewing the exported metrics can be found here: [Grafana.com Dashboards - Smartmon Textfile](https://grafana.com/dashboards/3992).

## Kubernetes Usage

The [`kubernetes/`](/kubernetes/) directory contains an example DaemonSet.
