#THIS IS NOT A STANDALONE MAKEFILE
#USE ../..//Makefile TO BUILD THE SERVICE
include SETTINGS.mk
include scripts/build/interactive.mk

all:
	@echo $(IMAGE) $(REGISTRY) $(IP)
	cp scripts/build/Dockerfile .
	cp scripts/build/.dockerignore . 
	ice --local build -t $(IMAGE) .
	ice --local tag -f $(IMAGE) $(REGISTRY)$(IMAGE)

