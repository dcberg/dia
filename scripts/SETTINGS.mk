IMAGE_DEFAULT := ice-pipeline-demo

#uncomment and specify Container Service defaults below
#REGISTRY_DEFAULT := 
#IP_DEFAULT := 

#uncomment and specify Tradeoff Analytics Service defaults below
#TA_URL := 
#TA_USER := 
#TA_PASS := 

CF_API_URL_DEFAULT := https://api.ng.bluemix.net
CONTAINER_SERVICE_NAME_DEFAULT := interconnect-container-service
TRADEOFF_SERVICE_NAME_DEFAULT := interconnect-tradeoff-service

TA_URL_DEFAULT := https://gateway.watsonplatform.net/tradeoff-analytics-beta/api
VCAP_SERVICES = '{ "tradeoff_analytics": [{ "name": "interconnect-tradeoff-service", "label": "tradeoff_analytics", "plan": "free", "credentials": { "url": "$(TA_URL)", "username": "$(TA_USER)", "password": "$(TA_PASS)" } }] }'
