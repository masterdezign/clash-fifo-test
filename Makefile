all: build

.PHONY: build
build:
	clash --vhdl Delayed.hs
