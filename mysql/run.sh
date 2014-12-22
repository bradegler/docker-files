#!/bin/bash

if [ ! -f /mysql-root-pw.txt ]; then

    /usr/bin/mysqld_safe &
    sleep 10s

    MYSQL_PASSWORD=`pwgen -c -n -1 12`

    echo mysql root password: $MYSQL_PASSWORD
    echo $MYSQL_PASSWORD > /mysql-root-pw.txt

    mysqladmin -u root password $MYSQL_PASSWORD
    mysql -uroot -p$MYSQL_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

fi

supervisord