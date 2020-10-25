# docker-node_exporter-smartmon

This Docker image needs to be run in privileged mode, for `smartctl` to be able to collect the SMART values.

Image available from Quay.io and Docker Hub:

* `quay.io/galexrt/node-exporter-smartmon:v1.2.0`
* `galexrt/node-exporter-smartmon:v1.2.0`

An auto build is triggered every week, be sure to check the git tags.

## Credits

The `smartmon.sh` has been directly taken from the [prometheus-community/node-exporter-textfile-collector-scripts](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts) ([prometheus/node_exporter](https://github.com/prometheus/node_exporter)) repository.

## Usage

The entrypoint script is putting the output into the directory `/var/lib/node_exporter` by default, filename `smartmon.prom`.

### Variables

| Name              | Default       | Description                                                   |
| ----------------- | ------------- | ------------------------------------------------------------- |
| `SCRIPT`          | `smartmon.sh` | Which of the node_exporter textfile collector scripts to run. |
| `OUTPUT_FILENAME` | `smartmon`    | Name of the output file (file ending is always `.prom`).      |
| `INTERVAL`        | `300`         | Interval at which to run the script at.                       |

Any flags / args given to the container are passed to the `SCRIPT` that will be executed.

## Grafana Dashboard

A Grafana dashboard for viewing the exported metrics can be found on [Grafana.com - Smartmon Textfile by Galexrt](https://grafana.com/dashboards/3992) and in the [`grafana/`](grafana/) directory.

## Kubernetes

The [`kubernetes/`](kubernetes/) directory contains an example DaemonSet for your Kubernetes cluster.
