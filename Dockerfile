FROM php:8.6.0-apache

RUN apt update; apt upgrade -y; \
    DEBIAN_FRONTEND=noninteractive TZ=America/Araguaina apt install -y locales locales-all \
    curl vim s3cmd postgresql-client mariadb-client netcat-traditional net-tools sysstat iotop \
    iputils-ping apt-utils libzip-dev libmcrypt-dev libicu-dev libldb-dev libldap2-dev \
    libxml2-dev libssl-dev libxslt-dev libpq-dev libbz2-dev libfreetype6-dev \
    libjpeg62-turbo-dev libonig-dev libsodium-dev wget unzip git \
    && echo "America/Araguaina" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/America/Araguaina /etc/localtime \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    a2enmod rewrite \
    && docker-php-ext-install zip \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install soap \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install gd \
    && docker-php-ext-install xsl \
    && docker-php-ext-install calendar \
    && docker-php-ext-install ctype \
    && docker-php-ext-install zip \
    && docker-php-ext-install session \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install xml \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install exif \
    && docker-php-ext-install sodium 

RUN chmod 777 /

VOLUME ["/var/www/html"]

CMD ["sleep", "infinity"]