# credit: helper code to implement the help target originally from https://stackoverflow.com/a/64996042/6090676
help:  ## Show this help message
	@grep -Eh '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}'
 
start:  ## Start SpiffWorkflow for local development
	@docker compose up -d

up:  ## Alias for start
up: start

pull:  ## Pull latest container images
	@docker compose pull

build:  ## Build or rebuild connector proxy image from source
	@docker compose build

destroy-db:	 ## Delete the database docker volume
	@if docker volume inspect spiffworkflow_backend_db >/dev/null; then \
		mountpoint=$$(docker volume inspect bpmn_spiffworkflow_backend_db --format="{{.Mountpoint}}"); \
		sudo rm "$$mountpoint/db.sqlite3"; \
	fi

logs:  ## Tail logs from the docker containers
	docker compose logs -f

down:	 ## Shut down containers, but leave images and database data around
	@docker compose down

destroy-all:  ## Delete all docker images, containers, and volumes. Leave no trace.
	@docker compose down --volumes --rmi all

update-docker-tags:  ## Update docker tags for backend, frontend, and connector
	@./bin/update_docker_tags
