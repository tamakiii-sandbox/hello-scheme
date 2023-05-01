.PHONY: help run test

INPUT := 1 2 3 4 -5 6

help:
	@cat $(firstword $(MAKEFILE_LIST))

run:
	echo "$(INPUT)" | guile main.scm

test:
	find test -name '*.test.scm' | xargs -I@ guile @
