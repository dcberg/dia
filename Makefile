NAME := ice-pipeline-demo
#for now, mock unique build identifiers with a random number
UUID := $(shell echo $$RANDOM)
TEST_IMAGE ?= $(NAME)-$(UUID)-test-build

include scripts/SETTINGS.mk

#Prompt for IMAGE value unless passed as command line argument
ifeq ($(origin IMAGE), undefined)
export IMAGE := $(shell read -p "Image [$(IMAGE_DEFAULT)]: " tmp; echo $${tmp:-'$(IMAGE_DEFAULT)'})	
endif

build-release-local:
	@make IMAGE=$(NAME) -j 1 -f scripts/build/Makefile build rerun-local

build-release-bluemix: .deploy-cf .setup-ics .login-ics
	@make IMAGE=$(NAME) -j 1 -f scripts/build/Makefile build rerun

build-test-release-local:
	@echo Build delivery pipeline is not fully working yet. Use at your own risk!
	@read -p "Press any key to continue" blah
#first, run the standard build, to create the default image, but with a <uuid>-test-build postfix
	@make IMAGE=$(TEST_IMAGE) -j 1 -f scripts/stages/Makefile pipeline-local

.deploy-cf:
	@make -j 1 -f scripts/cf.mk .deploy-cf

.setup-ics:
	@echo To proceed, login to the Bluemix console and open the Container service from the dashboard. Provide a registry name and note it along with the API key. Enter it at the prompt below.
	@make -j 1 -f scripts/ics.mk .login-ics
	@echo Next, you will be shown an IP address for the demo. Note it as well. Press any key to continue.
	@read tmp
	@ice ip request	
	@read -p "Press any key to continue" blah
	touch .setup-ics

.login-ics:
	@make -j 1 -f scripts/ics.mk .login-ics
