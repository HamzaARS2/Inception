FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    vsftpd net-tools nano ftp \
    && mkdir -p /var/run/vsftpd/empty \
    && rm -rf /var/lib/apt/lists/*

COPY conf/ftp.conf /etc/vsftpd.conf
COPY tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 21

ENTRYPOINT ["setup.sh"]