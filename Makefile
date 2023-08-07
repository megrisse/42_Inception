
build : 
	cd src/ && ./setup.sh && docker compose up --build

stop : 
	cd src/  && docker compose down --remove-orphans && ./setup.sh
