DOCKER_REPO?=registry.gocurb.internal:80
CONTAINER=$(DOCKER_REPO)/curbformation-templates-shared

all: build push clean

build:
	ansible-galaxy install -r requirements.yml -f
	docker build -t --no-cache --pull $(CONTAINER):latest . 

push:
	docker push $(CONTAINER)

clean:
	rm -r roles
	docker rmi $(CONTAINER)
	
