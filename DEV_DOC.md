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
    - For another user like the subject want: `USER2_LOGIN`, `USER2_PASSWORD`, `USER2_EMAIL`
*Note*: if you want to change the variables names, think to change them too in the different configuration files for each services.
*Folder Structure:*
- The volumes are in /home/<login>/data, if you want to change it, go to the docker-compose.yml and changes them in the volumes section around the end of file.
- Otherwise for the repository cloned, the structure is root/requirement/<the_differents_services>/<dockerfiles, conf files>.

## *2. Building & Launching (Technical)*
* `make`: Create folders for volumes. Builds images (using docker-compose : `docker compose -f srcs/docker-compose.yml up --build -d`) and starts containers in detached mode ( `-d`) to let them work in background.
- `make down`: Stops containers and removes the network.
- `make clean`: = down (subject want it)
- `make fclean`: Do `make down` and removes all images, and volumes (like when you cloned the repo).
- `make re`: Do a `make fclean` and `make`, commonly you use this to restart from 0.

## *3. Container Management*
- **Logs:** Use `docker logs [container_name]` to see what's happening inside.
- **Shell Access:** Use `docker exec -it [container_name] /bin/bash` to enter a running container.

## *4. Data Persistence & Storage*
**MariaDB:** The raw SQL files are stored on the host machine at `/home/<login>/data/mariadb`. This maps to `/var/lib/mysql` inside the MariaDB container.

**Wordpress:** The website files (PHP, images) are stored at `/home/<login>/data/wordpress`. This maps to `/var/www/html` inside the WordPress container.
