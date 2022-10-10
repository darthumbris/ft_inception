FROM debian:buster

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#install mariadb and other usefull applications
RUN apt-get install -y mariadb-server

#expose the port 3306 (as seen in subject)
EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/ .

# RUN sed -i 's/username_here/'$DB_USER'/g' initial_db.sql && \
#     sed -i 's/password_here/'$DB_PASSWORD'/g' initial_db.sql && \
#     sed -i 's/root_pw_here/'$DB_ROOT_PASSWORD'/g' initial_db.sql && \
#     sed -i 's/database_here/'$DB_NAME'/g' initial_db.sql

# RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf && \
#     sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf && \
#     sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN service mysql start && mysql < initial_db.sql
# RUN /etc/init.d/mysql restart
# RUN /etc/init.d/mysql stop
# RUN rm -f initial_db.sql;

RUN sh mariadb_startup.sh && rm -f mariadb_startup.sh

ENTRYPOINT ["mysqld"]