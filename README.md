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
- Docker Documentation: https://docs.docker.com/
- NGINX Documentation: https://nginx.org/en/docs/
- AI Usage: I used ChatGPT to help clarify the differences between Docker volumes and bind mounts, and to debug the NGINX configuration syntax. I verified all generated commands with the official documentation

## Project Description & Concepts
###Virtual Machines vs Docker
A Virtual Machine (VM) virtualizes the entire hardware, running a full Operating System (kernel + user space) on top of a hypervisor. This makes it heavy and slow to boot. Docker, on the other hand, uses containerization to virtualize the Operating System. Containers share the host's kernel but isolate the application processes and file systems. This makes Docker lightweight, fast, and portable.

### Secrets vs Environment Variables
Environment Variables are useful for configuration settings but can be insecure for sensitive data because they are often visible in logs or process inspections. Docker Secrets are designed to manage sensitive data (passwords, keys) securely. They are stored in encrypted files and mounted into the container only when needed, reducing the risk of accidental exposure. Note: In this project, we use a .env file as per the subject requirements, but secrets are the industry standard for production.

### Docker Network vs Host Network
Docker Network (Bridge/Custom) isolates container communications. Containers can only talk to each other if they are on the same network, usually resolving each other by service name. Host Network removes this isolation; the container shares the IP address and port space of the host machine directly. Using the host network is less secure and can lead to port conflicts.

### Docker Volumes vs Bind Mounts
Docker Volumes are managed entirely by Docker and stored in a secure location on the host (usually /var/lib/docker/volumes). They are the preferred mechanism for persisting data. Bind Mounts map a specific file or directory on the host machine (e.g., /home/<YOUR_LOGIN>/data) to a path inside the container. We use bind mounts in this project to comply with the requirement of storing data in a specific user directory
