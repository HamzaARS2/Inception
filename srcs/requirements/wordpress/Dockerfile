FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	php8.2-fpm \
	php8.2-mysql \
	redis-tools \
	curl \
	nano \
	net-tools \
	iputils-ping \
	&& rm -rf /var/lib/apt/lists/*

RUN curl https://wordpress.org/latest.tar.gz -o /tmp/wordpress.tar.gz \
	&& tar -xzvf /tmp/wordpress.tar.gz -C /tmp \
	&& mkdir -p /usr/src/wordpress \
	&& cp -r /tmp/wordpress/* /usr/src/wordpress/ \
	&& rm -rf /tmp/wordpress.tar.gz /tmp/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /tmp/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/wp.conf /etc/php/8.2/fpm/pool.d/zz-wp.conf
COPY tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["setup.sh"]

