FROM Debian:12-slim

RUN apt update && apt upgrade
RUN apt install -y curl nginx OpenSSL
RUN apt clean && rm -rf /var/lib/apt/lists/*	#lighten the image

# create folder for certificate
RUN mkdir -p /etc/nginx/ssl
# generate STL certificate good for 1 year
RUN openssl req -x509 -nodes -days 365 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=Occitanie/L=Perpignan/O=42/CN=lefoffan.42.fr/UID=lefoffan"

# create folder for nginx.conf
RUN mkdir -p /var/run/nginx
# copy our nginx.conf in the folder to nginx use it
COPY conf/nginx.conf /etc/nginx/nginx.conf

# allow nginx to communicate using port 80
EXPOSE 80

# start nginx
CMD ["nginx", "-g", "daemon off;"]
