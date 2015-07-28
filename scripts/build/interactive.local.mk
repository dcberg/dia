#prompt for tradeoff analytics if undefined and revert to default if not provided
ifndef TA_URL
export TA_URL := $(shell read -p "Tradeoff Analytics Service API endpoint [$(TA_URL_DEFAULT)]: " tmp; echo $${tmp:-'$(TA_URL_DEFAULT)'})
endif

#prompt for tradeoff analytics username and unset the variable (failure condition) if not provided
ifndef TA_USER
export TA_USER := $(shell read -p "Tradeoff Analytics Service username: " tmp; echo $$tmp)
endif
ifeq "$(strip $(TA_USER))" ""                
undefine TA_USER                        
endif                                                   
ifndef TA_USER  
$(error Tradeoff Analytics service username is not set)                     
endif


#prompt for tradeoff analytics password and unset the variable (failure condition) if not provided
ifndef TA_PASS
export TA_PASS := $(shell read -p "Tradeoff Analytics Service password: " tmp; echo $$tmp) 
endif                                   
ifeq "$(strip $(TA_PASS))" ""
undefine TA_PASS
endif
ifndef TA_PASS                                                                  
$(error Tradeoff Analytics service password is not set)                         
endif
