FROM php:8.0-fpm

RUN apt-get update \
    && docker-php-ext-install pdo pdo_mysql

RUN apt-get update && apt-get install -y --fix-missing \
    apt-utils \
    gnupg

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
RUN echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
RUN curl -sS --insecure https://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev

RUN docker-php-ext-install zip

ADD php.ini /usr/local/etc/php/conf.d/uploads.ini


