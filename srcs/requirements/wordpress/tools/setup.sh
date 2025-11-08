#!/bin/bash

echo "CHECKING WP IS-INSTALLED"
if ! wp core is-installed --allow-root 2>/dev/null; then
    # WP is not installed. Let's try installing it.
	# mkdir -p /var/www/html \
	echo "COPYING WORDPRESS FILES..."

	cp -r /usr/src/wordpress/* ./ \
	&& rm -rf /usr/src/wordpress/* \
	&& rmdir /usr/src/wordpress
	
	# changing owner of /var/www/html to www-data user as php-fpm uses this user.
	chown -R www-data:www-data ./
	echo "CREATING CONFIG FILE..."
	wp config create \
	--dbname=$WP_DB_NAME \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=$WP_DB_HOST --allow-root

	echo "INSTALLING WORDPRESS..."
	wp core install \
		--url="https://helarras.42.fr" \
		--title="7atba" \
		--admin_user=$WP_DB_USER \
		--admin_password=$WP_DB_PASSWORD \
		--admin_email=wpuser@gmail.com \
		--allow-root
else
	echo "WORDPRESS IS ALREADY INSTALLED!!!!!!!"

fi
# running php-fpm with -F option to run in the foreground
exec php-fpm8.2 -F
