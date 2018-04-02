FROM php:7.2-fpm-stretch

MAINTAINER John Kleijn <john@kleijnweb.nl>

RUN apt update && apt -y install wget git

RUN docker-php-ext-install bcmath

RUN apt -y install libicu57 libicu-dev
RUN docker-php-ext-install intl

RUN apt -y install libldb-dev libldap2-dev
RUN docker-php-ext-install ldap

RUN docker-php-ext-install pdo_mysql

RUN apt -y install libpq-dev libpq5
RUN docker-php-ext-install pdo_pgsql

RUN docker-php-ext-install shmop

RUN apt -y install libsodium-dev libsodium18
RUN docker-php-ext-install sodium

RUN apt -y install libxml2-dev libxml2
RUN docker-php-ext-install soap

RUN docker-php-ext-install sockets

RUN apt -y install libtidy-dev libtidy5
RUN docker-php-ext-install tidy

RUN apt -y install libxslt1.1 libxslt1-dev
RUN docker-php-ext-install xsl

RUN apt -y install zlib1g-dev
RUN docker-php-ext-install zip

RUN apt-get update && \
  apt-get install -y nginx && \
  sed -i 's/daemonize = no/daemonize = yes/' /usr/local/etc/php-fpm.d/zz-docker.conf

COPY web/php.ini "/usr/local/etc/php/php.ini"
COPY web/php-fpm-service /etc/init.d/php-fpm
COPY web/entrypoint.sh /docker-entrypoint
COPY web/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /etc/init.d/php-fpm && \
    update-rc.d php-fpm defaults && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    chmod +x /docker-entrypoint

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "/docker-entrypoint" ]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -qO- https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/sbin

EXPOSE 443
EXPOSE 80
