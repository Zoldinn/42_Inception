*This project has been created as part of the 42 curriculum by lefoffan.*

# Inception

## Description
This project aims to broaden our knowledge of system administration by using Docker. It consists of setting up a complete infrastructure composed of different services (NGINX, WordPress, MariaDB) within a Virtual Machine, following specific rules for isolation, persistence, and security.

## Instructions
1. **Clone the repository:** `git clone https://github.com/Zoldinn/42_Inception.git`
2. `cd inception`
3. Setup Environment: Ensure the `.env` file is present in `srcs/` (refer to `DEV_DOC.md` for details).
4. Launch the project: Run the Makefile from the root: `make`. This will build the Docker images and start the containers.

## Resources
- Docker Documentation: https://docs.docker.com
- MariaDB Documentation: https://mariadb.com/docs
- NGINX Documentation: https://nginx.org/en/docs
- A guide I partially used (mainly for MariaDB) : https://tuto.grademe.fr/inception/
- AI Usage: I used AI to help me clarify the architecture of the project at the starting because I was quite lost. I used it too for some parts of the docs. And also to debug the NGINX configuration syntax. I verified all generated commands with the differents resources that I used.
