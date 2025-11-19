#! /bin/bash

echo "Copying adminer files..."

cp -r /usr/src/adminer/adminer.php /var/www/adminer/ \
&& rm -rf /usr/src/adminer/* \
&& rmdir /usr/src/adminer

chown -R www-data:www-data /var/www/adminer

exec php-fpm8.2 -F