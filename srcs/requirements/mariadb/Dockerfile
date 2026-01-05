FROM debian:12-slim

RUN  apt update && apt install -y mariadb-server
RUN  rm -rf /var/lib/apt/lists/*

RUN  mkdir -p /var/run/mysqld && \
     chown -R mysql:mysql /var/run/mysqld

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/entrypoint.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["mysqld"]

