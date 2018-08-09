build:
	docker build -t kvineet/docker-pgadmin4:latest .

build-dev:
	docker build -t kvineet/docker-pgadmin4:dev .

run:
	docker run -it -d --name pgadmin --link postgres -p 5433:80 -v `pwd`/.pgadmin4:/data kvineet/docker-pgadmin4:latest
test:
	docker run -it -d --name pgadmin-dev --link postgres -p 5433:80 -v `pwd`/.pgadmin4:/data kvineet/docker-pgadmin4:dev
