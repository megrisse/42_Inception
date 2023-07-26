FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install curl -y

RUN mkdir /run/php

RUN apt install -y php7.3 php7.3-fpm php-mysql mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

COPY ./tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]