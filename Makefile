build:
	docker build -t kvineet/pgadmin4 .

run:
	docker run -it -d --link postgres -p 5433:80 -v `pwd`/.pgadmin4:/data kvineet/pgadmin4
