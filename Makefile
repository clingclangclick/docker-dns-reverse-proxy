export DOCKER_BUILDKIT=1

.PHONY: build
build:
	docker build . -t test:latest
