#! /bin/bash

useradd -m ftpuser && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
mkdir -p /home/ftpuser
chown -R ftpuser:ftpuser /home/ftpuser

exec /usr/sbin/vsftpd /etc/vsftpd.conf
