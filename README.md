# Greeting REST API Service (written in golang)

1. **Pre-requisities**

	* **Platform**: Ubuntu VM
	* **Configuration of Ubuntu VM**: Installed Docker, micro-k8s
	* **Tools used**: IntelliJ IDEA, Visual Code
	
1. This greeting-service exposes two endpoints
	```
	/greet      # returns Hello friends!!!
	/customers  # returns list of customers in JSON (by default), alternatively returns in XML format if Content-Type: application/xml header present in Reqest headers
	```
1. Build Instructions
	```
	make 			# this builds go binary and docker image
	docker login
	make push   	# pushes the docker image to docker hub
	```
1. Generate kubernetes specification files
	```
	make generate 
	```

1. Deploy in local microk8s kubernetes environment
	```
	make deploy
	```

1. Scale-up the deployment
	```
	make scale-up
	```

1. Scale-down the deployment
	```
	make scale-down
	```	

1. Undeploy from local microk8s kubernetes environment
	```
	make undeploy
	```

1. Remove the go binary
	```
	make clean
	```
1. Test the API
	```
	curl -v http://localhost:30007/greet 
	curl -v http://localhost:30007/customers
	curl -v --header "Content-Type: application/xml" http://localhost:30007/customers
	```