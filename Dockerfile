ARG VERSION=7.4
FROM php:${VERSION}-apache

# Run non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Instal MSMTP, GD, Zip, turn on rewrites, configure it all, and cleanup
# hadolint ignore=DL3018,DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
        # Install mail server
        msmtp \
        # Install gd for image stuff
        libfreetype6-dev \
        libwebp-dev \
        libjpeg-dev \
        libpng-dev \
        # Install zip for csv stuff
        libzip-dev \
        zip \
    && docker-php-ext-configure gd \
        --with-jpeg=/usr/include \
        --with-webp=/usr/include \
        --with-freetype=/usr/include \
    && docker-php-ext-install \
        pdo_mysql \
        gd \
        zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Copy some config files and a basic welcome screen
COPY ./config/php.ini /usr/local/etc/php/php.ini
COPY ./config/msmtprc /etc/msmtprc
COPY --chown=www-data:www-data src/ /var/www/html

WORKDIR /var/www/html

EXPOSE 80 443
