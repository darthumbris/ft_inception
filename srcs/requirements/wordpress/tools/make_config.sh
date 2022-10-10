 #!/bin/sh
sed -i "s|database_name_here|${DB_NAME}|g" wordpress/wp-config.php && \
sed -i "s|username_here|${DB_USER}|g" wordpress/wp-config.php &&\
sed -i "s|password_here|${DB_PASSWORD}|g" wordpress/wp-config.php &&\
sed -i "s|localhost|${DB_HOST}|g" wordpress/wp-config.php;
# sh /etc/init.d/php7.3-fpm start;
/usr/sbin/php-fpm7.3 -F