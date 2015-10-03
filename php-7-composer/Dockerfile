FROM php:7.0
MAINTAINER John Kleijn <john@kleijnweb.nl>
RUN apt-get update && apt-get -y install wget git zlib1g-dev && docker-php-ext-install zip
RUN wget -qO- https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin
RUN apt-get -y remove --purge wget && apt-get -y autoremove && apt-get clean
WORKDIR /project
ENTRYPOINT ["/usr/local/bin/composer"]