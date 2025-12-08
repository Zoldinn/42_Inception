FROM debian:12-slim

RUN apt update && apt install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /home/lefoffan/data && \
    chown -R mysql:mysql /home/lefoffan/data

# faire le entrypoint qui fera tout le blabla avec sql

EXPOSE 3306

USER mysql

#faudar plutot mettre le entrypoint
CMD ["mysqld"]

