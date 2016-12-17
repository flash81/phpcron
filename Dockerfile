FROM php:7.0
MAINTAINER yefengli <2684498887@qq.com>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libssl-dev \
        cron \
    && docker-php-ext-install pdo_mysql mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) bcmath \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb
ADD run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]