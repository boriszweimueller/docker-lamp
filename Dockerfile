FROM php:7.3-apache 
RUN docker-php-ext-install mysqli
RUN apt-get update \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && apt-get install -y libpng-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip
RUN /usr/local/bin/docker-php-ext-install gd
RUN /usr/local/bin/docker-php-ext-install pdo
RUN /usr/local/bin/docker-php-ext-install pdo_mysql
