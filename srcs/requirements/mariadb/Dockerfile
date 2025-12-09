FROM debian:12-slim

RUN apt update && apt install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

COPY my.cnf		/etc/mysql/mariadb.conf.d/50-server.cnf
COPY entrypoint.sh	/usr/local/bin/
RUN  chmod +x		/usr/local/bin/entrypoint.sh

RUN mkdir -p /home/lefoffan/data && \
    chown -R mysql:mysql /home/lefoffan/data

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["mysqld"]

