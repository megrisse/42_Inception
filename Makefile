
build :
	cd src/ && sudo ./setup.sh && sudo docker-compose up --build

stop :
	cd src/  && sudo docker-compose down && sudo ./setup.sh
