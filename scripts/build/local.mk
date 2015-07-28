include scripts/SETTINGS.mk
include scripts/build/interactive.local.mk

rerun-local:
	ice --local run -e VCAP_SERVICES=$(VCAP_SERVICES) -p 8022:22 -p 8080:80 -p 8090:8090 -p 5858:5858 -P $(IMAGE)
