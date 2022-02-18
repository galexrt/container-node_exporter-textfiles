# node_exporter Prerequisites

## Configuration

The `node_exporter` must have these flags set:

```console
--collector.textfile.directory=PATH
```

Also ensure that you are not actively disabling the `textfile` exporter (it is enabled by default), for more information see: [GitHub prometheus/node_exporter - Collectors section](https://github.com/prometheus/node_exporter#collectors).

### Containerized

If you are running node_exporter in containers (e.g., through Kubernetes), you need to add the textfile output path on the host to your node_exporter volumes.

The access from the node_exporter can be set to readOnly, but the textfiles container must read write to that directory.
