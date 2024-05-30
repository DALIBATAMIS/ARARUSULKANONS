BE_VERBOSE ?= false
FLAGS =
ifeq ($(BE_VERBOSE),true)
	FLAGS += -v -s -p -t
endif

default: build

build_sass:
	./build_scss.sh

install:
ifneq (,$(shell shards check | grep install))
	shards install
endif

dev: build
	./bin/ararusulkanons

build: build_sass install
	shards build -d --jobs=$(shell nproc --all) $(FLAGS)

release: build_sass install
	shards build --release --no-debug --jobs=4 --static $(FLAGS)