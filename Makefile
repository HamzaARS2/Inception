# docker compose path
COMPOSE_PATH = ./srcs/docker-compose.yml

# host volume paths
MARIADB_VOLUME_PATH = ~/data/mariadb
WP_VOLUME_PATH = ~/data/wordpress
ADMINER_VOLUME_PATH = ~/data/adminer

all: up

cvp:
	mkdir -p ${MARIADB_VOLUME_PATH} ${WP_VOLUME_PATH} ${ADMINER_VOLUME_PATH}

build:
	docker compose -f ${COMPOSE_PATH} build

up: build cvp
	docker compose -f ${COMPOSE_PATH} up -d

upf: build
	docker compose -f ${COMPOSE_PATH} up

down:
	docker compose -f ${COMPOSE_PATH} down

rmi:
	docker compose -f ${COMPOSE_PATH} down --rmi local

rmv:
	rm -rf ~/data

