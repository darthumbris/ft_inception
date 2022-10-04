# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: shoogenb <shoogenb@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/10/04 15:42:08 by shoogenb      #+#    #+#                  #
#    Updated: 2022/10/04 15:58:14 by shoogenb      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE=srcs/docker-compose.yml
WORDPRESS_DIR=/Users/shoogenb/data/wordpress
DB_DIR=/Users/shoogenb/data/mariadb

all: up

up: 
	mkdir -p ${WORDPRESS_DIR}
	mkdir -p ${DB_DIR}
	docker-compose -f ${COMPOSE_FILE} up --build -d

down:
	docker-compose -f ${COMPOSE_FILE} down --volumes

clean: down 
	docker system prune -a -f