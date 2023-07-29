#!/bin/bash 

sed -i "s/bind-address            = 127.0.0.1/bind-address           = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf


service mysql start

echo "CREATE DATABASE $DB_NAME ;" > database.sql
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> database.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> database.sql
echo "ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> database.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

mysql < database.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld