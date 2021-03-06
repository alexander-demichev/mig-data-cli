.PHONY: build clean test help default clean

BIN_NAME=mig-data-cli

VERSION := $(shell grep "const Version " version/version.go | sed -E 's/.*"(.+)"$$/\1/')

default: build

help:
	@echo 'Management commands for mig-data-cli:'
	@echo
	@echo 'Usage:'
	@echo '    make build           Compile the project.'
	
	@echo '    make clean           Clean the directory tree.'
	@echo

build:
	@echo "building ${BIN_NAME} ${VERSION}"
	@echo "GOPATH=${GOPATH}"
	go build -o bin/${BIN_NAME}

clean:
	@test ! -e bin/${BIN_NAME} || rm bin/${BIN_NAME}
	
test:
	go test ./...

