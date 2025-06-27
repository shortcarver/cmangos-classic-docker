init:
	docker network create mangos_network

build-ubuntu-base:
	docker build -t ubuntu-base --progress plain --no-cache -f Dockerfile-ubuntu-base .

build-build-server:
	docker build -t ubuntu-base --progress plain -f Dockerfile-ubuntu-base .
	docker build -t build-server --progress plain --no-cache -f Dockerfile-build-server .

build-mangos-server:
	docker build -t ubuntu-base --progress plain -f Dockerfile-ubuntu-base .
	docker build -t build-server --progress plain -f Dockerfile-build-server .
	docker build -t mangos-server --progress plain --no-cache -f Dockerfile-mangos-server .

run-mangos-server:
	docker build -t build-server --progress plain -f Dockerfile-build-server .
	docker run --network=mangos_network --interactive --tty --rm \
		build-server

initdb:
	docker run --network=mangos_network \
		--name mangosdb \
		--hostname mangosdb \
		-e MYSQL_ROOT_PASSWORD='root' \
		-p 3306:3306 \
		-v ./database/:/var/lib/mysql/ \
		-d \
		mysql:8.0.32
	docker run --network=mangos_network \
		--name phpmyadmin \
		--hostname phpmyadmin \
		-e PMA_HOST=mangosdb \
		-e PMA_PORT=3306 \
		-e PMA_USER=root \
		-e PMA_PASSWORD=root \
		-p 8081:80 \
		-d \
		phpmyadmin
	docker run --network=mangos_network --interactive --tty --rm \
		-v ./database-code/:/home/mangos/database \
		-w /home/mangos/database \
		mangos-server \
		bash ./InstallFullDB.sh
	# docker stop mangosdb
	# docker rm mangosdb

clean-database:
	cd database
	rm -rf *

extract-gamedata:
	docker run --network=mangos_network --interactive --tty --rm \
		-v ./gamedata/:/home/mangos/gamedata \
		-v ./config/:/home/mangos/etc \
		-v ./gamedata-extract/:/usr/local/gamedata \
		-w /usr/local/bin/tools \
		mangos-server \
		bash /usr/local/bin/tools/extract-game-data.sh

extract-config:
	docker run --network=mangos_network --interactive --tty --rm \
		-v ./config/:/home/mangos/etc \
		mangos-server \
		cp -R /usr/local/etc/ /home/mangos/

up:
	docker compose up 

down:
	docker compose down

attach:
	docker attach mangos-docker-mangosd-1
