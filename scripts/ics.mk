ifeq ($(origin ICS_API_KEY), undefined)
export ICS_API_KEY := $(shell read -p "IBM Container Service API key [$(ICS_API_KEY_DEFAULT)]: " tmp3; echo $${tmp3:-'$(ICS_API_KEY_DEFAULT)'})
endif

.login-ics:
	ice login -k $(ICS_API_KEY) -H https://api-ice.ng.bluemix.net/v1.0/containers -R registry-ice.ng.bluemix.net
	touch .login-ics
