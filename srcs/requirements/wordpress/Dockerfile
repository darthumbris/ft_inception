FROM debian:buster

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#wget is to get the wordpress
RUN apt-get install -y vim wget 

#installing all the php stuff
RUN php7.4 php7.4-mysql php7.4-cli php7.4-fpm php7.4-pdo php7.4-gd php7.4-mbstring php7.4-xml

#getting the wordpress package, extracting it and removing the tar.gz file
RUN wget -P /var/www/html https://wordpress.org/latest.tar.gz && \
    tar -xzvf /var/www/html/latest.tar.gz && rm -f /var/www/html/latest.tar.gz \
    && rm -f wordpress/wp-config-sample.php

COPY . .

RUN sh ./tools/make_config.sh && rm -f ./tools/make_config.sh

#changes the userID/group for the file hierarchies rooted in the files
RUN chmod 755 -R /var/www/html/wordpress/ && chown -R www-data:www-data /var/www/html/wordpress

#exposing port 9000 as seen in subject
EXPOSE 9000

ENTRYPOINT [ "/usr/sbin/php-fpm7.4", "-F", "-R" ]