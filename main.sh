#!/bin/bash

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

echo '[+] Starting mysql...'
service mysql start

echo '[+] Starting apache'
service apache2 start
mysql -uroot -pp4ssw0rd -e "CREATE USER dvwa@localhost IDENTIFIED BY 'p4ssw0rd';CREATE DATABASE dvwa;GRANT ALL privileges ON dvwa.* TO 'dvwa'@localhost;"

while true
do
    tail -f /var/log/apache2/*.log
    exit 0
done
