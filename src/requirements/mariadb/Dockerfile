FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server -y

COPY ./tools/script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh"]
