FROM php:8-fpm-alpine

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/user = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/public

RUN docker-php-ext-install pdo pdo_mysql

RUN chown -R ${PHPUSER}:${PHPGROUP} /var/www/html

# CMD [ "php-fpm", "y", "/etc/php/8.2/fpm/php-fpm.conf", "-R" ]

CMD ["php-fpm", "-F"]


