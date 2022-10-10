FROM debian:buster

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_HOST

WORKDIR /var/www/html

#exposing port 9000 as seen in subject
EXPOSE 9000

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#wget is to get the wordpress
RUN apt-get install -y vim wget php-fpm php-mysql

# getting the wordpress package, extracting it and removing the tar.gz file
RUN mkdir -p /var/www/html && wget https://wordpress.org/latest.tar.gz && \
    tar -xf latest.tar.gz \
    && rm -f latest.tar.gz \
    && rm -f wordpress/wp-config-sample.php \
    && rm -f wordpress/wp-config.php

COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php
COPY ./tools/make_config.sh .
COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN sh ./make_config.sh && rm -f make_config.sh

#the make_config script in the entrypoint so it can use the env variables
ENTRYPOINT [ "/usr/sbin/php-fpm7.3", "-F" ]