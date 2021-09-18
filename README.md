# container-node_exporter-smartmon

Container Image with the Prometheus Community's node-exporter-textfile-collector-scripts Repository checked out, with some utilities installed.

Container Image available from:

* [Quay.io](https://quay.io/repository/galexrt/node-exporter-smartmon)
* [GHCR.io](https://github.com/users/galexrt/packages/container/package/node-exporter-smartmon)

Container Image Tags:

* `main` - Latest build of the `main` branch.
* `vYYYYmmdd-HHMMSS-NNN` - Latest build of the application with date of the build.

## Credits

This docker image contains the [prometheus-community/node-exporter-textfile-collector-scripts](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts) repository, so that any script can be easily used with / from this Docker image.

## Usage

**This Docker image needs to be run in privileged mode for most of the scripts in the `prometheus-community/node-exporter-textfile-collector-scripts` repository, e.g., for `smartctl.sh` it is needed to be able to collect the SMART values.**

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
