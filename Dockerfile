FROM alpine:3.8

ENV PGADMIN_VERSION_MAJOR=4 
ENV PGADMIN_VERSION_MINOR=0

ENV PYTHON_PIP_VERSION=18.1

RUN apk add --no-cache alpine-sdk postgresql-client postgresql-dev python2 python2-dev libffi-dev linux-headers
RUN wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
	&& python get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION" 
RUN echo "https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${PGADMIN_VERSION_MAJOR}.${PGADMIN_VERSION_MINOR}/pip/pgadmin4-${PGADMIN_VERSION_MAJOR}.${PGADMIN_VERSION_MINOR}-py2.py3-none-any.whl" > requirements.txt \
	&& pip install --no-cache-dir -r requirements.txt 
RUN apk del alpine-sdk \
	&& rm -f get-pip.py 


RUN mkdir -p /data

COPY config_local.py /usr/lib/python2.7/site-packages/pgadmin4/

ENV SERVER_MODE false

ENV MAIL_SERVER   mail.example.tld
ENV MAIL_PORT     465
ENV MAIL_USE_SSL  true
ENV MAIL_USERNAME username
ENV MAIL_PASSWORD password


EXPOSE 80

CMD [ "python", "./usr/lib/python2.7/site-packages/pgadmin4/pgAdmin4.py" ]
