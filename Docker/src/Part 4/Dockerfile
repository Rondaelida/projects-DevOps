FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.c /server.c
COPY start_hello.sh /start_hello.sh

RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev