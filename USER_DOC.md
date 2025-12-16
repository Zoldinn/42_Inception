# User Documentation

## Services Provided
The Inception stack provides a fully functional web environment:
* **WordPress:** A robust Content Management System (CMS) for building websites.
* **MariaDB:** A relational database management system storing the website's data.
* **NGINX:** A high-performance web server acting as a secure entry point (HTTPS) and reverse proxy.

## How to Start and Stop the Project
All commands must be run from the root of the repository.

* **Start the infrastructure:**
  ```bash
  make
  ```
  The first launch may take a few minutes to build the images.

  ### Stop the infrastructure:
  ```bash
  make down
  ```
## Accessing the Website
Once the services are running, open your web browser.
- Main Website: https://lefoffan.42.fr
- Administration Panel: https://lefoffan.42.fr/wp-admin
  - Login: (See credentials below)
  - Password: (See credentials below)
#### Note: 
*Since we use a self-signed SSL certificate, your browser will display a security warning ("Your connection is not private"). This is expected; you can safely proceed by clicking "Advanced" -> "Proceed to...".*

## Credentials
For security reasons, credentials should not be hardcoded. However, for this evaluation context, the default credentials configured in the .env file are:
- WordPress Admin User: Check `WP_ADMIN_USER` in `srcs/.env`
- WordPress Admin Password: Check `WP_ADMIN_PASSWORD` in `srcs/.env`
- Database Root Password: Check `MYSQL_ROOT_PASSWORD` in `srcs/.env`

## Health Check
To verify that the services are running correctly:
1. `Run docker ps` in your terminal. You should see three containers (nginx, wordpress, mariadb) with the status Up.
2. Visit the URL. If the WordPress page loads, the stack is operational.
