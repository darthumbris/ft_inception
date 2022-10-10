FROM debian:buster

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#install mariadb and other usefull applications
RUN apt-get install -y mariadb-server

#expose the port 3306 (as seen in subject)
EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/ .

RUN chmod +x mariadb_startup.sh

#the startup script in the entrypoint so that it can use the env variables
ENTRYPOINT sh mariadb_startup.sh