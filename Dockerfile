FROM php:7.4-apache-bullseye

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    git \
    zip \
    ffmpeg=7:4.3.6-0+deb11u1 \
    wget=1.21-1+deb11u1 \
    lsb-release

#Installer l'extension bcmath et socket pour php
RUN  docker-php-ext-install bcmath sockets

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php

#Lancer l'installation de composer
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app

RUN composer install
