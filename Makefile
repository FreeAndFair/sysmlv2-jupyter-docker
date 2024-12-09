# SysMLv2 Release to use. First is release version of the API server,
# the second is the release version of the SysMLv2
release=2024-07
sysml_release=2024-09

# Jupyter - API server URL
SYSML_API_SERVER=http://sysmlapiserver:9000

# API server
DB_SERVER_URL = 'jdbc:postgresql://postgresdbserver:5432/sysml2'
DB_USER = 'postgres'
DB_PASSWORD = 'mysecretpassword'

# URL for the docker repository to push the image to.
DOCKER_REPOSITORY=registry-1.docker.io

# Organization within the docker repository to push to.
DOCKER_ORGANIZATION=freeandfair

# Name of the docker image to be created.
DOCKER_IMAGE=sysmlv2-jupyter

# Platform for the docker image.
DOCKER_PLATFORM="linux/amd64,linux/arm64"

##
## Local setup
##
.PHONY: build-api
build-api: ## build the API server docker image
	docker build -t sysml.api:$(release) -f Dockerfile.api --build-arg RELEASE=$(release) --build-arg DB_SERVER_URL=$(DB_SERVER_URL) --build-arg DB_USER=$(DB_USER) --build-arg DB_PASSWORD=$(DB_PASSWORD) .

.PHONY: build-jupyter
build-jupyter: ## build the API+Jupyter Jupyter docker image
	docker build -t sysml.jupyter:$(sysml_release) -f Dockerfile.jupyter --build-arg RELEASE=$(sysml_release) --build-arg SYSML_API_SERVER=$(SYSML_API_SERVER) .

.PHONY: create-periphery
create-periphery: ## Create network and volume for docker compose
	-docker network create thenetwork
	docker volume create postgresdbserver

.PHONY: spin-up
spin-up: create-periphery build-jupyter build-api ## spin all servers up
	SYSML_RELEASE=$(sysml_release) RELEASE=$(release) docker compose -f docker-compose.yml up

##
## MyBinder image
##
.PHONY: build-mybinder
build-mybinder: ## build mybinder Jupyter image
	docker build -t sysml.mybinder:$(sysml_release) -f Dockerfile --build-arg RELEASE=$(sysml_release) .

.PHONY: run-mybinder
run-mybinder: build-mybinder # run the mybinder jupyter image
	docker run -p 8888:8888 -t sysml.mybinder:$(sysml_release) jupyter lab --ip 0.0.0.0 --port 8888

##
## Dockerhub image
##
.PHONY: build-hub
build-hub: ## build DockerHub image
	docker buildx build --platform $(DOCKER_PLATFORM) -t $(DOCKER_ORGANIZATION)/$(DOCKER_IMAGE):$(sysml_release) -f Dockerfile.hub --build-arg RELEASE=$(sysml_release) .

.PHONY: run-hub
run-hub: build-hub ## run DockerHub image
	docker run -p 8888:8888 -e NO_TOKEN=yes -it $(DOCKER_ORGANIZATION)/$(DOCKER_IMAGE):$(sysml_release)

.PHONY: login
login: ## log into DockerHub repository
	$(info [info] logging into dockerhub repository)
	docker login $(DOCKER_REPOSITORY)

.PHONY: logout
logout: ## log out of DockerHub repository
	$(info [info] Logging out of dockerhub repository)
	docker logout $(DOCKER_REPOSITORY)

.PHONY: pull
pull: login  ## pull docker image from DockerHub repository
	docker pull $(DOCKER_ORGANIZATON)/$(DOCKER_IMAGE):latest

.PHONY: push
push: login ## push docker image to DockerHub repository
	docker image tag $(DOCKER_ORGANIZATION)/$(DOCKER_IMAGE):$(sysml_release) $(DOCKER_ORGANIZATION)/$(DOCKER_IMAGE):latest
	docker push $(DOCKER_ORGANIZATION)/$(DOCKER_IMAGE):$(sysml_release)
	docker push $(DOCKER_ORGANIZATION)/$(DOCKER_IMAGE):latest

## Build all
.PHONY: build
build: build-api build-hub build-mybinder build-jupyter ## build all images
	echo done

.PHONY: build-latest
build-latest: build-api build-jupyter
	docker tag sysml.api:$(release) sysml.api:latest
	docker tag sysml.jupyter:$(sysml_release) sysml.jupyter:latest

# Note that these next two commands require that a container is running.
# Run `make spin-up` first.
.PHONY: get-notebooks
get-notebooks: ## retrieve all notebooks in a standalone running container
	docker exec -i $$(docker ps | grep sysml.jupyter | awk '// { print $$1 }') /bin/bash -c "tar czf - notebooks" | tar xzf -

## Update all test suite notebooks
.PHONY: update-testsuite
update-testsuite: ## Update the test suite directory, run `make spin-up` first
	docker exec -i $$(docker ps | grep sysml.jupyter | awk '// { print $$1 }') jupyter nbconvert --execute --inplace --to=notebook notebooks/gorenje/TestSuiteGenerator.ipynb
	$(MAKE) get-notebooks

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
