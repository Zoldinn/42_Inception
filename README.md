*This project has been created as part of the 42 curriculum by lefoffan.*

# *Inception*

## *Description*
This project aims to broaden our knowledge of system administration by using Docker. It consists of setting up a complete infrastructure composed of different services (NGINX, WordPress, MariaDB), following specific rules for isolation, persistence, and security.

## *Instructions*
1. **Clone the repository:** `git clone https://github.com/Zoldinn/42_Inception.git`
2. **Go to the project's root:** `cd inception`
3. **Setup Environment:** ensure the `.env` file is present in `srcs/` (refer to `DEV_DOC.md` for details). Add the domain name to the `/etc/hosts` which should be `<login>.42.fr` like the subject want so you should add something like : `127.0.0.1 <login>.42.fr`
4. **Launch the project:** run the Makefile from the root: `make`. This will build the Docker images and start the containers.

## *Resources*
- **Docker Documentation:** https://docs.docker.com
- **MariaDB Documentation:** https://mariadb.com/docs
- **NGINX Documentation:** https://nginx.org/en/docs
- A guide I partially used (mainly for MariaDB) : https://tuto.grademe.fr/inception/

## *AI Usage*
I used AI to help me clarify the architecture of the project at the starting because I was quite lost. I used it too for some parts of the docs. And also to debug the NGINX configuration syntax. I checked all the commands generated and always asked for more explanations about why and what it would bring me, rather than just copy/past.

## *Project description and concepts*

### *Virtual Machines vs Docker*
A virtual machine simulates all of a PC's hardware, its kernel, OS, drivers, etc... , so it consumes a lot of resources on the host machine. Whereas a container such as Docker only simulates the OS and isolates the different processes, which makes them much lighter to use.

### *Secrets VS Environment Variables*
For this project, I used a `.env` file for simplicity, but Docker Secrets are generally better for security. For example, if a hacker succeeds in gaining access to the server's terminal, they could simply run `docker inspect` to reveal all passwords stored in environment variables in plain text. Secrets avoid this exposure.

### *Docker Network vs Host Network*
Docker Network creates a private virtual network allowing containers to communicate using their own internal ports, rather than exposing the host machine's ports directly. This isolation ensures that sensitive host ports remain protected, significantly improving security. Furthermore, using Docker Network is a mandatory requirement of the subject.

### *Docker Volumes vs Bind Mounts*
If we don't specify a location to store data, Docker creates volumes in an internal server folder. It acts like a black box where we don't have direct access. Specifying a folder (Bind Mount) makes it easier for us to check the data. It also forces us to handle permissions manually. But principally, we use this method because the subject explicitly requires it.
