#!make
include .env
export


DOCKER_COMPOSE=docker-compose -p $(APP_NAME) -f "./docker-compose.yml"

.DEFAULT_GOAL := help

help:	## show this help message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v -fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:	## build docker images for the project
	@docker-compose -f "./docker-compose.yml" build

up:		## start all containers
	@${DOCKER_COMPOSE} up

down:	## stop all containers
	@${DOCKER_COMPOSE} down

rebuild: $(addprefix rebuild-, $(SERVICES_SERVER_NAME))

rebuild-%:
	@docker-compose -f "./docker-compose.yml" stop -t 1 $(@:rebuild-%=%)
	@docker-compose -f "./docker-compose.yml" build $(@:rebuild-%=%)

restart: $(addprefix restart-, $(SERVICES_SERVER_NAME))

restart-%:
	@docker-compose -f "./docker-compose.yml" stop -t 1 $(@:restart-%=%)
	@docker-compose -f "./docker-compose.yml" build $(@:restart-%=%)
	@docker-compose -f "./docker-compose.yml" restart $(@:restart-%=%)
	