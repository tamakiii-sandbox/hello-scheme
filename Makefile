.PHONY: help test

help:
	@cat $(firstword $(MAKEFILE_LIST))

test:
	find test -name '*.test.scm' | xargs -I@ guile @
