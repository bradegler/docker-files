#!/bin/bash


if [ -z $MYSQL_ROOT_PASSWORD ]; then

    MYSQL_ROOT_PASSWORD=`pwgen -c -n -1 12`

fi

/usr/bin/mysqld_safe &

mysqladmin --wait=10 -u root password $MYSQL_ROOT_PASSWORD
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

supervisord