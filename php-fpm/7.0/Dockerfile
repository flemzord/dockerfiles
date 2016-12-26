FROM php:7.0-fpm-alpine

RUN apk add --no-cache --virtual .phpize-deps-configure $PHPIZE_DEPS \
    && pecl install redis \
    && docker-php-ext-enable redis

# install extensions
RUN apk add --update --no-cache libintl icu icu-dev libxml2-dev git \
    && docker-php-ext-install intl zip soap mysqli pdo pdo_mysql

COPY php.ini /usr/local/etc/php/

copy composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer
RUN composer self-update

WORKDIR /home/www
