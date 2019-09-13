FROM php:7.1-cli

ARG UID

ENV DEBIAN_FRONT nointeractive

RUN apt-get update && apt-get install -y \
    less \
    nano \
    mc \
    git \
    supervisor \
    sudo \
    openssh-server \
    cron \
    && rm -rf /var/lib/apt/lists/*

# user
RUN useradd --create-home --uid $UID --shell /bin/bash user
COPY sudo/user /etc/sudoers.d
COPY home/.profile /home/user/
RUN echo 'user:password' | chpasswd

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/local/bin/composer

# adjust php

RUN apt-get update && apt-get install -y libzip-dev  && docker-php-ext-install zip && rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug-2.7.2 && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo_mysql sockets bcmath

RUN apt-get update && apt-get install -y libicu-dev && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN  apt-get update && apt-get install -y libjpeg62-turbo-dev libpng-dev libfreetype6-dev && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/png/ --with-freetype-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

COPY conf.d/ /usr/local/etc/php/conf.d/

# cron file
COPY cron/crontab /etc/crontab
RUN chmod 0644 /etc/crontab

# supervisor
COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisor/conf.d/ /etc/supervisor/conf.d/
EXPOSE 9001

ENTRYPOINT ["/bin/systemd"]