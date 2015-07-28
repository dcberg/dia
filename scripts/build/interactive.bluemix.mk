ifeq ($(origin IMAGE), undefined)
export IMAGE := $(shell read -p "Image [$(IMAGE_DEFAULT)]: " tmp; echo $${tmp:-'$(IMAGE_DEFAULT)'})	
endif
ifeq ($(origin REGISTRY), undefined)
export REGISTRY := $(shell read -p "Registry [$(REGISTRY_DEFAULT)]: " tmp2; echo $${tmp2:-'$(REGISTRY_DEFAULT)'})
endif
ifeq ($(origin IP), undefined)
export IP := $(shell read -p "IP [$(IP_DEFAULT)]: " tmp3; echo $${tmp3:-'$(IP_DEFAULT)'})
endif
