Setup
-----

To get started, enter your boot2docker environment with

	boot2docker ssh

	

and install required command line tools using the following

	tce-load -wi make

	curl -o cf.tgz -L -O https://cli.run.pivotal.io/stable?release=linux32-binary
	sudo tar -zxvf cf.tgz -C /usr/bin/

	tce-load -wi python
	curl https://bootstrap.pypa.io/get-pip.py -o - | sudo python
	curl https://bootstrap.pypa.io/ez_setup.py -o - | sudo python
	curl -O https://static-ice.ng.bluemix.net/icecli-1.0.zip
	sudo pip install icecli-1.0.zip

Download the latest version of the code using

	git clone -b interconnect https://hub.jazz.net/git/jhpedemonte/node_docker_sample; cd node_docker_sample

and provide your JazzHub credentials as needed.

There are two non-mutually exclusive options to host the code Option 1) local Docker container; or Option 2) Bluemix Container Service

Deploy
------

Option 1. Deploy to a local Docker container

Add Tradeoff Analytics service credentials to your environment 

	export TA_URL=https://gateway.watsonplatform.net/tradeoff-analytics-beta/api TA_USER=d37e8c57-6b27-4c77-ae38-7e0c0d343f40 TA_PASS=ppxm1EVy80Yr

You can also edit the [scripts/SETTINGS.mk](https://hub.jazz.net/project/jhpedemonte/node_docker_sample/overview#https://hub.jazz.net/gerrit/plugins/gerritfs/contents/jhpedemonte%252Fnode_docker_sample/refs%252Fheads%252Ftradeoff/scripts/SETTINGS.mk) file instead to avoid having to re-export the variables again.

Run the build and deploy process

	make build-release-local

When prompted for the image name (defaults to ice-pipeline-demo), you can hit enter to accept the default or type in your own.

The default run scenario maps the container port 80 to host port 8080, so depending on the port forwarding configuration of your boot2docker environment, the application should be accessible from 

	http://localhost:8080/

Login using bob / secret

The scenario is described in more detail in the Demo section.

Option 2. Deploy to the Bluemix Container Service

**NOTE**: It is highly recommended that you create a dedicated organization and/or space under your Bluemix account just for the purposes of this demo. The release stage of the pipeline will attempt to create a new Container Service instance for you, which will fail if you have already provisioned a Container Service. It is possible to have multiple Container Service spaces in your organization, one per each space. You will be prompted to choose a space where to provision this demo during the Cloud Foundry login process.

Start the process to build and to deploy to Bluemix:

	make build-release-bluemix

When prompted for the image name (defaults to ice-pipeline-demo) and the Bluemix Cloud Foundry API endpoint (defaults to https://api.ng.bluemix.net) you can hit enter to accept the defaults or type in your own.

When prompted by the cf login command use your Bluemix credentials to login. Specify the organization and space where to deploy the application.

The release process will remind you to make sure there are no conflicting Container Service instances in your organization. It will also deploy a NOOP app to integrate the demo application with the Tradeoff Analytics service.

Once the Container Service is created, follow the instructions to obtain the Container Service API key and enter it when prompted. Note the IP address provided by the Container Service and enter it when prompted. **WARNING**: it is likely that this step will fail due to high demand for the Container Service.

Once the IP address is provided, use it to login to http://<ip> with bob / secret as credentials.

Demo
----

Act I

The scenario begins with the sales person starting a discussion with an insurance/financial customer about retirement plans and insurance risks. The sales person logs in to the application (use bob/secret) and opens the planning calculator (http://<ip>/calculator). Calculations about the financial situation of the customer leads the sales person to offer a range of company's products to the customer. The sales person opens the product list using the left hand side menu (http://<ip>/table). However the product list is very long and detailed. The customer doesn't know what to choose. Summary of pain points.

Scene change. 

A developer comes to the rescue. Using Bluemix to discover and add the tradeoff analytics service to the application, the developer then opens the [source code](https://hub.jazz.net/project/jhpedemonte/node_docker_sample/overview#https://hub.jazz.net/gerrit/plugins/gerritfs/contents/jhpedemonte%252Fnode_docker_sample/refs%252Fheads%252Finterconnect/dist/public/templates/layouts/navigation.dust) and changes the UI (the link with the investmentsIcon (not list-investmentsIcon) should change from pointing to /table to point to /investment) to take advantage of the new service. The developer relies on Docker to rapidly package and deploy the application. 

Act II

The sales person loads the latest and greatest version of the application. Returning to the customer, the sales person is now armed with a powerful analytics and visualization framework enabling a richer dialog with the customer about the range of product options.
