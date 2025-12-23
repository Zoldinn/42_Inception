# Developer Documentation

## *1. Environment Setup (From Scratch)*
**Prerequisites:** You need Docker, Docker Compose, and Make installed.
**Configuration:**
- Create a `.env` file in `srcs/`.
- Populate it with theses variables *(they're cognates)*:
  - General information: `DOMAIN_NAME`, `SITE_TITLE`.
  - For MariaDB: `SQL_DATABASE`, `SQL_USER`, `SQL_PASSWORD`, `SQL_ROOT_PASSWORD`.
  - For Wordpress:
    - For the admin: `ADMIN_USER`, `ADMIN_PASSWORD`, `ADMIN_EMAIL`
    - For another user, like the subject want: `USER2_LOGIN`, `USER2_PASSWORD`, `USER2_EMAIL`

*Note*: if you want to change the variables names, think to change them too in the different configuration files for each services.

*Folder Structure*:
- The volumes are in `/home/<login>/data`, if you want to change it, go to the `docker-compose.yml` and changes them in the volumes section around the end of file.
- Otherwise, for the repository cloned, the structure is:
  - root :
    - README.md
    - USER_DOC.md
    - DEV_DOC.md
    - Makefile
    - srcs/ :
      - docker-compose.yml
      - .env
      - requirements/ :
        - nginx/ :
          - conf/ :
            - nginx.conf
          - Dockerfile
        - wordpress/ :
          - tools/ :
            - entrypoint.sh
          - Dockerfile
        - mariadb/ :
          - conf/ :
            - my.cnf
          - tools/ :
            - entrypoint.sh
          - Dockerfile

## *2. Building & Launching (Technical)*
* `make`: Create folders for volumes. Builds images (using docker-compose : `docker compose -f srcs/docker-compose.yml up --build -d` (`-f` to specify where is docker-compose.yml)) and starts containers in detached mode ( `-d`) to let them work in background.
- `make down`: Stops containers and removes the network (using : `docker compose -f srcs/docker-compose.yml down`).
- `make clean`: = down (subject want it)
- `make fclean`: Do `make down` and removes all images (`docker system prune -af`, `-a` to delete all images unused and `-f` to avoid confirming each deletions), and volumes (`sudo rm -rf /home/<login>/data/*`). 
- `make re`: Do a `make fclean` and `make`, commonly you use this to restart from 0.

## *3. Container Management*
- **Logs:** Use `docker logs [container_name]` to see what's happening inside.
- **Shell Access:** Use `docker exec -it [container_name] /bin/bash` to enter a running container (`-it`: `-i` to write inputs, and `-t` to have a terminal).
- **To see the network(s):** Use `docker network ls`
- **To check volumes:** Use `docker volume ls` and `docker volume inspect <volume_name>`
- **To check the DB:** Use `docker exec -it <mariaDB_container_name> mariadb -u <user> -p` (`-u` for ask with which user, `-p` to ask the password discretely (you don't want to have your password that appear in your terminal history)), then `SHOW DATABASES;`, `USE <db_name>;` (it's like a `cd`), `SHOW TABLES;`, and for example `SHOW * FROM wp_users;` to see all (the `*`) in `wp_users`.

## *4. Data Persistence & Storage*
**MariaDB:** The raw SQL files are stored on the host machine at `/home/<login>/data/mariadb`. This maps to `/var/lib/mysql` inside the MariaDB container.
**Wordpress:** The website files (PHP, images) are stored at `/home/<login>/data/wordpress`. This maps to `/var/www/html` inside the WordPress container.
