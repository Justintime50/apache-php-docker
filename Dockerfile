ARG VERSION=7.4
FROM php:${VERSION}-apache

# Run non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install mail server and turn on Apache rewrites
RUN apt-get update \
    && apt-get -y install msmtp \
    && a2enmod rewrite

COPY ./config/php.ini /usr/local/etc/php/php.ini
COPY ./config/msmtprc /etc/msmtprc
COPY --chown=www-data:www-data src/ /var/www/html

WORKDIR /var/www/html

EXPOSE 80 443
