FROM php:7.0-cli-jessie

MAINTAINER John Kleijn <john@kleijnweb.nl>

RUN apt update && apt -y install wget

RUN docker-php-ext-install bcmath

RUN apt-cache search libicu && apt -y install libicu52 libicu-dev
RUN docker-php-ext-install intl

RUN apt -y install libldb-dev libldap2-dev
RUN docker-php-ext-install ldap

RUN docker-php-ext-install pdo_mysql

RUN apt -y install libpq-dev libpq5
RUN docker-php-ext-install pdo_pgsql

RUN docker-php-ext-install shmop

RUN apt -y install libxml2-dev libxml2
RUN docker-php-ext-install soap

RUN docker-php-ext-install sockets

RUN apt -y install libtidy-dev libtidy5
RUN docker-php-ext-install tidy

RUN apt -y install libxslt1.1 libxslt1-dev
RUN docker-php-ext-install xsl

RUN apt -y install zlib1g-dev
RUN docker-php-ext-install zip

RUN wget -qO- https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/sbin

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
