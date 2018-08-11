# Development

build-dev:
	docker build -t kvineet/docker-pgadmin4:dev .
test:
	docker run -d --name pgadmin-dev --link postgres -p 5433:80 -v `pwd`/.pgadmin4:/data kvineet/docker-pgadmin4:dev
test-nolink: 
	docker run -d --name pgadmin-dev -p 5433:80 -v `pwd`/.pgadmin4:/data kvineet/docker-pgadmin4:dev
build:
	docker build -t kvineet/docker-pgadmin4:latest .
run:
	docker run -d --name pgadmin --link postgres -p 5433:80 -v `pwd`/.pgadmin4:/data kvineet/docker-pgadmin4:latest
run-nolink:
	docker run -d --name pgadmin -p 5433:80 -v `pwd`/.pgadmin4:/data kvineet/docker-pgadmin4:latest
