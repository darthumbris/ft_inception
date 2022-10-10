FROM debian:buster

WORKDIR /var/www/html

#exposing port 9000 as seen in subject
EXPOSE 9000

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#wget is to get the wordpress
RUN apt-get install -y vim wget php-fpm php-mysql

RUN mkdir -p /var/www/html

# getting the wordpress package, extracting it and removing the tar.gz file
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xf latest.tar.gz \
    && rm -f latest.tar.gz \
    && rm -f wordpress/wp-config-sample.php \
    && rm -f wordpress/wp-config.php

COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php
COPY ./tools/make_config.sh /var/
COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

#changes the userID/group for the file hierarchies rooted in the files
RUN chmod 755 -R /var/www/html/wordpress && chown -R www-data:www-data /var/www/html/wordpress && \
        mkdir -p /run/php/ && touch /run/php/php7.3-fpm.pid

#the make_config script in the entrypoint so it can use the env variables
ENTRYPOINT [ "sh", "/var/make_config.sh" ]