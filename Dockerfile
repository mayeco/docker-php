FROM debian:8.1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y \
        php5-common \
        php5-cli \
        php5-fpm \
        php5-apcu \ 
        php5-curl \
        php5-gd \
        php5-imagick \
        php5-intl \
        php5-json \
        php5-mcrypt \
        php5-mysql \
        php5-gearman \
        php5-redis \
        php5-mongo \
        php5-readline \
        php5-memcached \
    && rm -rf /var/lib/apt/lists/*

RUN rm /etc/php5/fpm/pool.d/*

ADD php.pool.conf /etc/php5/fpm/pool.d/

ADD php.ini /etc/php5/fpm/conf.d/
ADD php.ini /etc/php5/cli/conf.d/

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf

RUN usermod -u 1000 www-data

WORKDIR /var/www

CMD ["php5-fpm"]

EXPOSE 9000
