
#putting the user and password from the .env into the config
sed -i -e "s/\${DB_USER}/${MYSQL_USER}/g" ./conf/mariadb.conf;
sed -i -e "s/\${DB_PASSWORD}/${MYSQL_PASSWORD}/g" ./conf/mariadb.conf;

#starting up the mysql service
service mysql start;

#creating user and naming database and grantinc access to user
echo "CREATING USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';";
echo "CREATING DATABASE ${MYSQL_NAME};";
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;";
echo "FLUSH PRIVILEGES;";

#stopping the mysql service
service mysql stop;
#starting the mysql database
mysqld;