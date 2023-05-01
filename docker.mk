.PHONY: help build bash clean

USERNAME := $(shell git config user.name)
REPOSITORY := $(shell basename $$(git rev-parse --show-toplevel))
IMAGE := $(USERNAME)/$(REPOSITORY)
TAG := latest

docker-run = docker run -it --rm -v $(PWD):/opt/$(USERNAME)/$(REPOSITORY) -w /opt/$(USERNAME)/$(REPOSITORY) $(IMAGE):$(TAG) $1

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash: build
	$(call docker-run,$@)

run: build
	$(call docker-run,make $@)

test: build
	$(call docker-run,make $@)

clean:
	docker image rm -f $(IMAGE):$(TAG)
