ARG VERSION=7.4
FROM php:${VERSION}-apache

# Run non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install mail server, php mysql extension, and turn on Apache rewrites - cleanup at the end
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
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
