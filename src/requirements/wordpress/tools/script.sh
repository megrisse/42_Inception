#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g" /etc/php/7.3/fpm/pool.d/www.conf

wp --allow-root core download
wp --allow-root core config --dbhost=mariadb --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS

chmod 777 /var/www/html/wp-config.php

wp --allow-root core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email

wp --allow-root user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_PASS 

echo "define( 'WP_REDIS_HOST', 'redis' );" >> /var/www/html/wp-config.php
echo "define( 'WP_REDIS_PORT', 6379 );" >> /var/www/html/wp-config.php
echo "define('WP_CACHE', true);" >> /var/www/html/wp-config.php

# sed -i "s/define( 'WP_DEBUG', false );/define( 'WP_DEBUG', true );/g" /var/www/html/wp-config.php

wp --activate --allow-root theme install astra

wp --activate --allow-root plugin install redis-cache

wp --all --allow-root plugin update

wp --allow-root redis enable

exec php-fpm7.3 -F
