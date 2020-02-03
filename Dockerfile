ARG VERSION=7.4
FROM php:${VERSION}-apache

# Run non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install zip for csv stuff
# hadolint ignore=DL3018
RUN apt-get update && apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip

# Install gd for image stuff
# hadolint ignore=DL3018
RUN apt-get update && apt-get install -y libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ \
    && docker-php-ext-install gd \
    && apt-get clean

# Install mail server, php mysql extension, and turn on Apache rewrites - cleanup at the end
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y \
        msmtp \
    && docker-php-ext-install pdo_mysql \
    && a2enmod rewrite \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy some config files and a basic welcome screen
COPY ./config/php.ini /usr/local/etc/php/php.ini
COPY ./config/msmtprc /etc/msmtprc
COPY --chown=www-data:www-data src/ /var/www/html

WORKDIR /var/www/html

EXPOSE 80 443
