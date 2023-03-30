TARGETS := $(shell ls scripts)

GO ?= CGO_ENABLED=0 GO111MODULE=on go

# find or download dapper
# download controller-gen if necessary
DAPPER_PATH := $(shell eval go env GOPATH)
.PHONY: dapper
dapper:
ifeq (, $(shell command -v dapper))
	$(GO) install github.com/verrazzano/rancher-dapper@${CONTROLLER_GEN_VERSION}
	$(eval DAPPER=$(DAPPER_PATH)/bin/dapper)
else
	$(eval DAPPER=$(shell command -v dapper))
endif

$(TARGETS): dapper
	dapper $@

.DEFAULT_GOAL := ci

.PHONY: $(TARGETS)

