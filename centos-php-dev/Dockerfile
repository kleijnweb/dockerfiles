FROM centos:7
MAINTAINER John Kleijn <john@kleijnweb.nl>
RUN yum -y install httpd php php-cli php-mysql php-ldap php-memcache php-curl php-xml php-soap php-devel php-pear gcc gcc-c++ autoconf automake make
RUN pecl install xdebug
RUN yum -y remove php-devel gcc gcc-c++ autoconf automake make
RUN yum clean all
ADD xdebug.ini /etc/php.d/xdebug.ini
