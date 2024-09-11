FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
  unzip \
  libzip-dev
RUN docker-php-ext-install zip
COPY --from=composer:2.7 /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html
COPY ./ .

RUN composer install