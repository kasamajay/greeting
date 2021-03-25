REPO=kasamajay
IMAGE=greeting-service
TAG=0.1.2

build:
	go build -o bin/app; \
	docker build -t $(REPO)/$(IMAGE):$(TAG) -f dockerfiles/Dockerfile .

push:
	docker push $(REPO)/$(IMAGE):$(TAG)

clean:
	rm -rf bin

generate:
	microk8s.kubectl create deployment greeting --image=$(REPO)/$(IMAGE):$(TAG) --dry-run=client -o yaml  > k8s-files/deployment-greeting.yaml; \
	microk8s.kubectl create service nodeport greeting --tcp=8080:8080 --node-port=30007 --dry-run=client -o yaml > k8s-files/svc-greeting.yaml

deploy:
	microk8s.kubectl apply -f k8s-files/

scale-up:
	microk8s.kubectl scale deployment/greeting --replicas=3

scale-down:
	microk8s.kubectl scale deployment/greeting --replicas=1

undeploy:
	microk8s.kubectl delete -f k8s-files/