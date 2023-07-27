FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y && apt install vim -y && apt install curl -y

RUN mkdir -vp /etc/nginx/ssl && apt install OpenSSL -y
