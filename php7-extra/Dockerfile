FROM php:7.0
MAINTAINER John Kleijn <john@kleijnweb.nl>
RUN apt-get update && apt-get -y install wget zip zlib1g-dev libmemcached-dev libsqlite3-dev libldap2-dev libcurl4-gnutls-dev libxml2-dev
RUN cd /usr/src/php/ext &&  wget -q https://github.com/php-memcached-dev/php-memcached/archive/php7.zip && unzip php7.zip
RUN ln -sf /usr/lib/x86_64-linux-gnu/libl* /usr/lib/ && docker-php-ext-install xml soap curl ldap php-memcached-php7 zip pdo_mysql pdo_sqlite
RUN apt-get -y remove --purge wget zip zlib1g-dev libsqlite3-dev libldap2-dev libcurl4-gnutls-dev libxml2-dev && apt-get -y autoremove && apt-get clean