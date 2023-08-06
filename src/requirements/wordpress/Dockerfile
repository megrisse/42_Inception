FROM debian:buster

WORKDIR /var/www/html

RUN chmod -R 777 /var/www/html

RUN mkdir /run/php

COPY tools/script.sh script.sh

COPY tools/wp-config.php wp-config.php

RUN chmod +x script.sh

RUN apt update -y && apt upgrade -y

RUN apt install curl -y

RUN apt install -y php7.3 php-fpm php-mysql mariadb-client

CMD ["./script.sh"]