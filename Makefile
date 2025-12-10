all: up

up:
	mkdir -p /home/lefoffan/data/wordpress
	mkdir -p /home/lefoffan/data/mariadb
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

clean: down

fclean: clean
	docker system prune -af
	sudo rm -rf /home/lefoffan/data/*

re: fclean all

.PHONY: all up down clean fclean re
