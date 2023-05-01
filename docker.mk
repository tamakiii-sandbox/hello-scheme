.PHONY: help build bash clean

USERNAME := $(shell git config user.name)
REPOSITORY := $(shell basename $$(git rev-parse --show-toplevel))
IMAGE := $(USERNAME)/$(REPOSITORY)
TAG := latest

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash: build
	docker run -it --rm -v $(PWD):/opt/$(USERNAME)/$(REPOSITORY) -w /opt/$(USERNAME)/$(REPOSITORY) $(IMAGE):$(TAG) $@

clean:
	docker image rm -f $(IMAGE):$(TAG)
