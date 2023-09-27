
build :
	cd src/ && ./setup.sh && docker-compose up --build

stop :
	cd src/  && docker-compose down && ./setup.sh