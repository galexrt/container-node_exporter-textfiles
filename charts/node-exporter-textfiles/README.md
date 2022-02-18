# node-exporter-textfiles Helm Chart

## Prerequisites

Checkout the [node_exporter textfile Configuration documentation](../../docs/node_exporter.md) to ensure your node_exporter is configured to pickup the textfile exported metrics.

## Installation

You can customize the textfiles deployed by modifying the `values.yaml` to your needs.

```console
$ helm upgrade --install RELEASE_NAME . --values values.yaml
```

## Uninstall

Replace `RELEASE_NAME` with the Helm release name, to see your current Helm releases you can use `helm ls`.

```console
$ helm uninstall RELEASE_NAME
```
