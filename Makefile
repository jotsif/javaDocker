PKG?=appdata/java8
VERSION_TAG=1.8.51-16
CURDIR='$(shell pwd)'
DOCKER?=$(CURDIR)/docker


container:
	docker build -t $(PKG) $(DOCKER)
	docker tag -f $(PKG):latest $(PKG):$(VERSION_TAG)
