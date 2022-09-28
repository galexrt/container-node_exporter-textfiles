# node-exporter-textfiles Helm Chart

## Prerequisites

Checkout the [node_exporter textfile Configuration documentation](../../docs/node_exporter.md) to ensure your node_exporter is configured to pickup the textfile exported metrics.

## Get Repo Info

```console
helm repo add node-exporter-textfiles https://galexrt.github.io/container-node_exporter-textfiles
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release node-exporter-textfiles/node-exporter-textfiles
```

## Uninstalling the Chart

To uninstall/delete the my-release deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.
