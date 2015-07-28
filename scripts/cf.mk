include scripts/SETTINGS.mk
ifeq ($(origin CF_API_URL), undefined)
export CF_API_URL := $(shell read -p "Cloud Foundry API endpoint [$(CF_API_URL_DEFAULT)]: " tmp3; echo $${tmp3:-'$(CF_API_URL_DEFAULT)'})
endif

.login-cf:
	cf login -a $(CF_API_URL)
	touch .login-cf

.deploy-cf: .login-cf
	@echo Before proceeding, make sure to delete any existing instances of the container and tradeoff analytics services in the organization where you are logged on to Bluemix.
	@read -p "Press any key to continue."  blah
	mkdir -p tmp/tmp
	-cf push NOOP -p tmp  -i 1 -d mybluemix.net -k 1M -m 64M --no-hostname --no-manifest --no-route --no-start
	rm -r tmp
	-cf create-service Containers free $(CONTAINER_SERVICE_NAME_DEFAULT)
	-cf create-service tradeoff_analytics free $(TRADEOFF_SERVICE_NAME_DEFAULT)
	-cf bind-service NOOP $(TRADEOFF_SERVICE_NAME_DEFAULT)
#	-cf restage NOOP	
	touch .deploy-cf
