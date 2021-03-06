FROM php:7.3-fpm

ARG UID

ENV DEBIAN_FRONT nointeractive

RUN apt-get update && apt-get install -y \
    less \
    nano \
    mc \
    git \
    sudo \
    node.js \
    npm  \
    && rm -rf /var/lib/apt/lists/*

# user
RUN useradd --create-home --uid $UID --shell /bin/bash user
COPY sudo/user /etc/sudoers.d

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/local/bin/composer

# adjust php

RUN apt-get update &&  apt-get install -y libzip-dev && docker-php-ext-install zip && rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug-2.9.2 && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo_mysql sockets bcmath

RUN apt-get update && apt-get install -y libicu-dev && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN apt-get update &&  apt-get install -y libjpeg62-turbo-dev libpng-dev libfreetype6-dev && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/png/ --with-freetype-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

RUN apt-get update && apt-get upgrade -y && apt install -y libmagickwand-dev --no-install-recommends && \
        pecl install imagick && docker-php-ext-enable imagick && \
        rm -rf /var/lib/apt/lists/*


RUN mkdir /usr/local/var/log/php/
RUN chmod 0777 /usr/local/var/log/php
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY conf.d/ /usr/local/etc/php/conf.d/

USER user