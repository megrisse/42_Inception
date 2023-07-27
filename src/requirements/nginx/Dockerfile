FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y && apt install vim -y && apt install curl -y

RUN apt install openssl -y

COPY ./tools/script.sh .
COPY ./conf /etc/nginx/sites-available/default

RUN chmod +x script.sh

CMD ["./script.sh"]