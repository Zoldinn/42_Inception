FROM Debian:12-slim

RUN apt update
RUN apt install -y mariadb-server
RUN apt clean && rm -rf /var/lib/apt/lists/*
RUN systemctl start mariadb

COPY my.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /home/leon/data

CMD ["mysqld"]
