#!/bin/bash 

sed -i "s/bind-address            = 127.0.0.1/bind-address           = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf


service mysql start

echo "CREATE DATABASE $db_name ;" > database.sql
echo "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_password' ;" >> database.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> database.sql
echo "ALTER USER '$db_user'@'%' IDENTIFIED BY '$db_password' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

mysql < database.sql

mysqld