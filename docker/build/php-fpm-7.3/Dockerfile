FROM php:7.3-fpm

ENV DEBIAN_FRONT nointeractive

RUN apt-get update && apt-get install -y less nano mc git

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/local/bin/composer

# adjust php

RUN docker-php-ext-install pdo_mysql