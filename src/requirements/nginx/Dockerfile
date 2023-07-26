FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y && apt install vim -y && apt install curl -y

RUN mkdir -p /etc/nginx/ssl && apt install OpenSSL -y && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=megrisse.42.fr/UID=megrisse"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf