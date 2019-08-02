FROM php:7.1-cli

ENV DEBIAN_FRONT nointeractive

RUN apt-get update && apt-get install -y less nano mc git

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/local/bin/composer

# adjust php

RUN apt-get install -y zlib1g-dev unzip && docker-php-ext-install zip

RUN pecl install xdebug-2.7.2 && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo_mysql sockets bcmath

RUN apt-get install -y libicu-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN apt-get install -y libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/png/
RUN docker-php-ext-install -j$(nproc) gd

ADD xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
ADD php.ini /usr/local/etc/php/conf.d/php.ini