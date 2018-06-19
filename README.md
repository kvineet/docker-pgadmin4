# PostgreSQL pgAdmin 4 with binary support

This is modified version of [foxylion's pgadmin4 docker file](https://github.com/foxylion/docker-pgadmin4.git)

Instead of using `python:2-alpine` as base image, this dockerfile uses `alpine:3.7`. That way latest version of `pg_dump` and `pg_restore` tools can be installed. just build the image again when [newer version](https://pkgs.alpinelinux.org/packages?name=postgresql-client&branch=edge) of `postgresql-client` is available on `alpine`

To upgrade pgadmin version set the environment variables and build the image again.

```
ENV PGADMIN_VERSION_MAJOR 3 
ENV PGADMIN_VERSION_MINOR 0
```
There is probably no need to ever update python pip version, as latest is installed whenever new image is built. Update this when `10.0.1` becomes too old.

```
ENV PYTHON_PIP_VERSION 10.0.1
```

- `make build` will create the new image with tag `kvineet/pgadmin4`.
- `make run` will mount `./.pgadmin4` directory to `/data` and expose port 80 on host port 5433
