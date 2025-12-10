FROM debian:12-slim

# install dependencies
RUN apt update && apt upgrade -y && apt install -y curl \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-intl \
    php-mbstring \
    php-soap \
    php-xml \
    php-zip \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# directory for php to stock his pid file
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

# install wp-cli (wordpress client)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY entrypoint.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/entrypoint.sh

# move to this directory to avoid using cd all times in the script
WORKDIR /var/www/wordpress

# this way wp and nginx can communicates
EXPOSE 9000

# run the script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm8.2", "-F"]
# -F to avoid php go working in background, bc it could provoc docker to shutdown
