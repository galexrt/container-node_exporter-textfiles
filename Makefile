SHELL := /usr/bin/env bash -euo pipefail -c
.EXPORT_ALL_VARIABLES:

RELEASE_TAG := v$(shell date +%Y%m%d-%H%M%S-%3N)

# Default is the main branch as that is where the "latest" tag should be
VERSION ?= main
VERSION_SHORT ?= $(shell cut -d '-' -f 1 <<< "$(VERSION)")

## Create and push a newly generated git tag to trigger a new automated CI run
release:
	git tag $(RELEASE_TAG)
	$(MAKE) container-build container-push VERSION="$(RELEASE_TAG)"
	git push origin $(RELEASE_TAG)

## Build the container image
container-build:
	docker build \
		--build-arg BUILD_DATE="$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')" \
		--build-arg VCS_REF="$(shell git rev-parse HEAD)" \
		-t ghcr.io/galexrt/node-exporter-textfiles:$(VERSION) \
		.
	docker tag ghcr.io/galexrt/node-exporter-textfiles:$(VERSION) quay.io/galexrt/node-exporter-textfiles:$(VERSION)

	if [ "$(VERSION)" != "$(VERSION_SHORT)" ]; then \
		docker tag ghcr.io/galexrt/node-exporter-textfiles:$(VERSION) ghcr.io/galexrt/node-exporter-textfiles:$(VERSION_SHORT); \
		docker tag ghcr.io/galexrt/node-exporter-textfiles:$(VERSION) quay.io/galexrt/node-exporter-textfiles:$(VERSION_SHORT); \
	fi

container-push:
	docker push ghcr.io/galexrt/node-exporter-textfiles:$(VERSION)
	docker push quay.io/galexrt/node-exporter-textfiles:$(VERSION)

	if [ "$(VERSION)" != "$(VERSION_SHORT)" ]; then \
		docker push ghcr.io/galexrt/node-exporter-textfiles:$(VERSION_SHORT); \
		docker push quay.io/galexrt/node-exporter-textfiles:$(VERSION_SHORT); \
	fi
