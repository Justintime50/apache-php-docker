ARG VERSION=7.4
FROM php:${VERSION}-apache

# Run non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install PHP packages and extensions
# hadolint ignore=DL3018,DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Install mail server
    msmtp \
    # Install gd for image functions
    libfreetype6-dev \
    libwebp-dev \
    libjpeg-dev \
    libpng-dev \
    # Install zip for csv functions
    libzip-dev \
    zip \
    # Configure image library
    && docker-php-ext-configure gd \
    --with-jpeg=/usr/include \
    --with-webp=/usr/include \
    --with-freetype=/usr/include \
    # Configure PHP extensions for use in Docker
    && docker-php-ext-install \
    pdo_mysql \
    gd \
    zip \
    # Enable Apache Rewrites
    && a2enmod rewrite \
    # Clean up
    && rm -rf /var/lib/apt/lists/*

COPY /config/php.ini /usr/local/etc/php/php.ini
COPY /config/msmtprc /etc/msmtprc
COPY --chown=www-data:www-data src/ /var/www/html

WORKDIR /var/www/html

EXPOSE 80 443
