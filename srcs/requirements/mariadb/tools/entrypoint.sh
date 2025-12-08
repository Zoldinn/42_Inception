#!/bin/bash

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]; then
	service mariadb start

	# wait mariadb start
	until mysqladmin ping; do
		sleep 1
	done

	# configure the DB with SQL instructions
	mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" # create wordpress user
	mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"
	mariadb -e "ALTER USER 'root@localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" # change root's password
	mariadb -u root -p "${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

	mysqladmin -u root -p "${SQL_ROOT_PASSWORD}" shutdown # down mariadb because configuration finished
	
	echo "DB Created !"
else
	echo "DB Already exist"
fi

# start mariadb
exec "$@"
