FROM php:7.3-apache 
RUN docker-php-ext-install mysqli
RUN apt-get update \
    && apt-get install -y libjpeg-dev \
    && apt-get install -y libfreetype6-dev \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && apt-get install -y libpng-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip
RUN apt-get install -y libjpeg62-turbo-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN /usr/local/bin/docker-php-ext-install gd
RUN /usr/local/bin/docker-php-ext-install pdo
RUN /usr/local/bin/docker-php-ext-install pdo_mysql
