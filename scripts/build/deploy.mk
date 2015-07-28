#THIS IS NOT A STANDALONE MAKEFILE
#USE ../../Makefile TO BUILD THE SERVICE
include SETTINGS.mk
include scripts/build/interactive.mk

all:
	ice --local tag -f $(IMAGE) $(REGISTRY)$(IMAGE)
	ice --local push $(REGISTRY)$(IMAGE)

	-ice stop $(IMAGE)
	-ice ip unbind $(IP) $(IMAGE)
	-ice rm $(IMAGE)
	sleep 3
	ice run -n $(IMAGE) $(REGISTRY)$(IMAGE)
	sleep 10
	ice ip bind $(IP) $(IMAGE)
