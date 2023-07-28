#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g" /etc/php/7.3/fpm/pool.d/www.conf

wp --allow-root core download
wp --allow-root config create

mv wp-config-sample.php wp-config.php

sed -i -r "s/database_name_here/$db_name/1"   wp-config.php
sed -i -r "s/username_here/$db_user/1"  wp-config.php
sed -i -r "s/password_here/$db_password/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php

wp --allow-root core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email
wp --allow-root user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_PASS 

php-fpm7.3 -F

sleep 1000