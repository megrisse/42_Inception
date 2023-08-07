#!bin/bash

mkdir -vp /var/www/html

cd /var/www/html

wget "http://www.adminer.org/latest.php" -O adminer.php

mv latest.php adminer.php

chown -R www-data:www-data /var/www/html/adminer.php

chmod 755 adminer.php

php -S 0.0.0.0:1337