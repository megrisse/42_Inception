
# rm -rf /home/megrisse/data
# mkdir -vp /home/megrisse/data/mariadb /home/megrisse/data/wordpress

docker rm $(docker ps -qa)
docker rmi $(docker images -q)
docker volume rm $(docker volume ls -q)

rm -rf /Users/megrisse/Desktop/42_Inception/data
mkdir -vp /Users/megrisse/Desktop/42_Inception/data/wordpress /Users/megrisse/Desktop/42_Inception/data/mariadb