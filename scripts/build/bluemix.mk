include scripts/SETTINGS.mk
include scripts/build/interactive.bluemix.mk

push:
	ice --local tag -f $(IMAGE) $(REGISTRY)/$(IMAGE)
	ice --local push $(REGISTRY)/$(IMAGE)

rerun:
	-ice stop $(IMAGE)
	-ice ip unbind $(IP) $(IMAGE)
	-ice rm $(IMAGE)
	sleep 5
	ice run --name $(IMAGE) --bind NOOP $(REGISTRY)/$(IMAGE)
	sleep 10
	ice ip bind $(IP) $(IMAGE)
