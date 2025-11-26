FROM Debian:12-slim

RUN apt update && apt upgrade
RUN apt install -y vim curl nginx OpenSSL
# lighten the image
RUN apt clean && rm -rf /var/lib/apt/lists/*

# create folder for certificate
RUN mkdir -p /etc/nginx/ssl
# generate STL certificate good for 1 year
RUN openssl req -x509 -nodes -days 365 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=Occitanie/L=Perpignan/O=42/CN=lefoffan.42.fr/UID=lefoffan"

# create folder for files configuration of NGINX
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

# allow nginx to communicate
EXPOSE 80

# start nginx
CMD ["nginx", "-g", "daemon off;"]
