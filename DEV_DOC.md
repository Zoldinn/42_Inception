# Developer Documentation

## Environment Setup
This project requires **Docker** and **Docker Compose** installed on a Linux Virtual Machine.

### 1. Configuration (`.env`)
Create a `.env` file in the `srcs/` directory. It must contain the following variables:
```bash
DOMAIN_NAME=<YOUR_LOGIN>.42.fr
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress_user
MYSQL_PASSWORD=secure_password
MYSQL_ROOT_PASSWORD=secure_root_password
WP_ADMIN_USER=admin_user  # Must not contain "admin"
WP_ADMIN_PASSWORD=secure_admin_password
WP_USER=subscriber
WP_PASSWORD=subscriber_password
```
### 2. Directory Structure
Ensure the host folder structure exists for data persistence (created automatically by Makefile):
- `/home/<YOUR_LOGIN>/data/db`
- `/home/<YOUR_LOGIN>/data/wordpress`
## Build and Launch
We use a Makefile to automate Docker Compose operations.
- Build and Start (Detached): `make`
- Stop and Remove Containers: `make down`
- Clean (Containers + Images): `make clean`
- Full Clean (Containers + Images + Volumes): `make fclean`

## Container & Volume Management
- Check Status: `docker compose -f srcs/docker-compose.yml ps`
- View Logs: `docker compose -f srcs/docker-compose.yml logs -f`
- Access Container Shell: `docker exec -it <container_name> /bin/bash`

## Data Persistence
Data persistence is handled via Bind Mounts defined in docker-compose.yml:
- MariaDB:
  - Host Path: `/home/<YOUR_LOGIN>/data/db`
  - Container Path: `/var/lib/mysql`
  - *Purpose: Ensures database records survive container restarts.*
- WordPress:
  - Host Path: `/home/<YOUR_LOGIN>/data/wordpress`
  - Container Path: `/var/www/html`
  - Purpose: Persists website files and uploaded media.

If you run make fclean, the local data folders will be emptied/deleted to ensure a fresh start.
