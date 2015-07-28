include scripts/SETTINGS.mk

build:
	cp scripts/build/Dockerfile .
	cp scripts/build/.dockerignore . 
	ice --local build -t $(IMAGE) .

rerun:
	@make -j 1 -f scripts/build/bluemix.mk push rerun

rerun-local:
	@make -j 1 -f scripts/build/local.mk
