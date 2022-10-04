FROM debian:buster

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#install mariadb and other usefull applications
RUN apt-get install -y vim curl mariadb-server

COPY . .

#expose the port 3306 (as seen in subject)
EXPOSE 3306

ENTRYPOINT [ "sh", "./tools/mariadb_startup.sh" ]