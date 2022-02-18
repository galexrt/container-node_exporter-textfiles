# node_exporter Prerequisites

## Configuration

The `node_exporter` must have this flag set:

```console
--collector.textfile.directory=YOUR_TEXTFILE_OUTPUT_PATH
```

(Where `YOUR_TEXTFILE_OUTPUT_PATH` when using this repos default would be `/var/lib/node_exporter`)

Also ensure that you are not actively disabling the `textfile` exporter (it is enabled by default), for more information see: [GitHub prometheus/node_exporter - Collectors section](https://github.com/prometheus/node_exporter#collectors).

### Containerized

If you are running node_exporter in containers (e.g., through Kubernetes), you need to add the textfile output path on the host to your node_exporter volumes.

The access from the node_exporter can be set to readOnly, but the textfiles container must read write to that directory.

When using the default values of the provided `node_exporter-textfiles` Helm Chart, you need to add a `hostPath` volume to your `node_exporter` to the path `/var/lib/node_exporter` and a `volumeMounts` entry.

Example YAML snippets for your `node_exporter` DaemonSet in Kubernetes:

```yaml
additionalVolumes:
- hostPath:
    path: /dev
  name: host-dev
- hostPath:
    path: /var/lib/node_exporter
  name: host-textfile
```

```yaml
volumeMounts:
- mountPath: /var/lib/node_exporter
  name: host-textfile
  readOnly: false
```
