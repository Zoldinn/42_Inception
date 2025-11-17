FROM Debian:12-slim

# Installation of nginx
RUN sudo apt update
RUN sudo apt install -y curl nginx
# lighten the image
RUN apt clean && rm -rf /var/lib/apt/lists/*

# open port 80 to allowed nginx to communicate
EXPOSE 80

# start nginx
CMD ["nginx", "-g", "daemon off;"]
