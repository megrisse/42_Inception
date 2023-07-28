#!/bin/bash

openssl genpkey -algorithm RSA -out /etc/ssl/private/nginx-selfsigned.key

mkdir -vp /etc/ssl/csr

openssl req -new -key /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/csr/nginx-selfsigned.csr -subj "/C=MO/L=KH/O=1337/OU=student/CN=megrisse.1337.ma" 


openssl x509 -req -days 365 -in /etc/ssl/csr/nginx-selfsigned.csr -signkey /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

nginx -g "daemon off;"

sleep 100000