RELEASE_TAG := v$(shell date +%Y%m%d-%H%M%S-%3N)

build:
	docker build -t galexrt/node-exporter-smartmon:latest .

release:
	git tag $(RELEASE_TAG)
	git push origin $(RELEASE_TAG)

release-and-build: build
	git tag $(RELEASE_TAG)
	docker tag galexrt/node-exporter-smartmon:latest galexrt/node-exporter-smartmon:$(RELEASE_TAG)
	git push origin $(RELEASE_TAG)
	docker push galexrt/node-exporter-smartmon:$(RELEASE_TAG)
	docker push galexrt/node-exporter-smartmon:latest
