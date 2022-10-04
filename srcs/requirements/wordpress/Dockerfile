FROM debian:buster

WORKDIR /var/www/html/

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#wget is to get the wordpress
RUN apt-get install -y vim wget 

#installing all the php stuff
RUN apt-get install -y php php-mysql php-cli php-fpm php-pdo php-gd php-mbstring php-xml

#getting the wordpress package, extracting it and removing the tar.gz file
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xf latest.tar.gz -C /var/www/html/ \
    && rm -f latest.tar.gz \
    && rm -f /var/www/html/wordpress/wp-config-sample.php

COPY . .

RUN sh ./tools/make_config.sh && rm -f ./tools/make_config.sh

#changes the userID/group for the file hierarchies rooted in the files
RUN chmod 755 -R /var/www/html/wordpress/ && chown -R www-data:www-data /var/www/html/wordpress

#exposing port 9000 as seen in subject
EXPOSE 9000

#start the php fpm service
RUN sh /etc/init.d/php7.3-fpm start

ENTRYPOINT [ "/usr/sbin/php-fpm7.3", "-F", "-R" ]