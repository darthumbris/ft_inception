
#putting the user and password from the .env into the config
sed -i -e "s/\${DB_USER}/${DB_USER}/g" ./conf/mariadb.conf;
sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" ./conf/mariadb.conf;

#starting up the mysql service
service mysql start;

echo "Creating user: '${DB_USER}'@'%' with password: '${DB_PASSWORD}';";
echo "Creating database: ${DB_NAME};";
echo "Grant priviliges on *.* to: '${DB_USER}'@'%' with grant option;";
echo "Flush priviliges;";

#stopping the mysql service
service mysql stop;
#starting the mysql database
mysqld;