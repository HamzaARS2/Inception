FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    redis nano net-tools \
    && rm -rf /var/lib/apt/lists/*

COPY conf/zz-redis.conf /etc/redis/zz-redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis/zz-redis.conf"]