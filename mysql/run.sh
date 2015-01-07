#!/bin/bash

if [ ! -f /tmp/mysql_pwd ]; then

    echo $MYSQL_ROOT_PASSWORD > /tmp/mysql_pwd

    /usr/bin/mysqld_safe &

    mysqladmin --wait=10 -u root password $MYSQL_ROOT_PASSWORD
    mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

fi

supervisord