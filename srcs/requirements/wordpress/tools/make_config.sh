sed -i 's/database_name_here/'$WP_NAME'/g' ./conf/wp-config.php && \
sed -i 's/username_here/'$WP_USER'/g' ./conf/wp-config.php &&\
sed -i 's/password_here/'$WP_PASSWORD'/g' ./conf/wp-config.php &&\
sed -i 's/localhost/'$WP_HOSTNAME'/g' ./conf/wp-config.php;\
echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf; \
mv ./conf/wp-config.php /var/www/html/wordpress/wp-config.php