FROM debian:buster

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#install nginx and other usefull applications
RUN apt-get install -y vim curl openssl nginx net-tools

# making a new ssl key
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    # -addext "subjectAltName=DNS:${DOMAIN_NAME}" \
    -out /etc/ssl/certs/nginx_server.csr \
    -keyout /etc/ssl/private/nginx_server.key -subj "/C=/ST=/L=/O=/CN=${DOMAIN_NAME}"

#copy the config for nginx from the local directory to the directory in the image
COPY conf/default.conf /etc/nginx/sites-available/nginx.conf

#exposing port 443 for the nginx server
EXPOSE 443

#the command run when this container starts
ENTRYPOINT ["nginx", "-g", "daemon off;"]