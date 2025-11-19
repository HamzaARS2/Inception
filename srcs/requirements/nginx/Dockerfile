FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    nginx nano telnet net-tools \
    && mkdir -p /etc/nginx/certs \
    && rm -rf /var/lib/apt/lists/*

# COPY conf/nginx.conf /etc/nginx/conf.d/
EXPOSE 443 4000

ENTRYPOINT ["nginx", "-g", "daemon off;"]