FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server nano net-tools \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/zz-mariadb.cnf
COPY tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 3306

ENTRYPOINT ["setup.sh"]
