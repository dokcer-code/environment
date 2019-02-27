FROM php:7.2-fpm 

ENV DEBIAN_FRONT nointeractive

RUN apt-get update && apt-get install -y less nano mc

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/local/bin/composer

# adjust php

RUN apt-get install -y zlib1g-dev unzip && docker-php-ext-install zip
RUN pecl install xdebug-2.6.1 && docker-php-ext-enable xdebug
RUN docker-php-ext-install pdo_mysql

RUN apt-get install -y libicu-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl