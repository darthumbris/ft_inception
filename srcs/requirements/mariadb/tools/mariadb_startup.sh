
#putting the user and password from the .env into the config
sed -i -e "s/\${DB_USER}/${MARIADB_USER}/g" ./conf/mariadb.conf;
sed -i -e "s/\${DB_PASSWORD}/${MARIADB_PASSWORD}/g" ./conf/mariadb.conf;

#starting up the mysql service
service mysql start;

#creating user and naming database and grantinc access to user
echo "CREATING USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';";
echo "CREATING DATABASE ${MARIADB_NAME};";
echo "GRANT ALL ON *.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;";
echo "FLUSH PRIVILEGES;";

#stopping the mysql service
service mysql stop;
#starting the mysql database
mysqld;