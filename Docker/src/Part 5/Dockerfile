FROM nginx:latest

USER root

WORKDIR /home/

COPY /nginx.conf /etc/nginx/nginx.conf
COPY /server.c /home/server.c
COPY /start_hello.sh /home/start_hello.sh

RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    useradd nginx; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists

USER nginx


