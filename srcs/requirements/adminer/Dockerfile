FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	php8.2-fpm \
	php8.2-mysql \
	curl \
	nano \
	net-tools \
    && rm -rf /var/lib/apt/lists/*
	
RUN mkdir -p /usr/src/adminer \
	&& curl -L https://www.adminer.org/latest.php -o /usr/src/adminer/adminer.php

COPY conf/admin-fpm.conf /etc/php/8.2/fpm/pool.d/zz-admin-fpm.conf
COPY tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 4000

ENTRYPOINT ["setup.sh"]