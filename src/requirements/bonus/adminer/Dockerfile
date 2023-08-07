FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget -y && apt-get install php php-mysql -y

COPY tools/script.sh script.sh

RUN chmod +x script.sh

CMD [ "./script.sh" ]