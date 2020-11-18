<div align="center">

# Apache/PHP Docker Image

A combined Apache/PHP Docker image.

[![Build Status](https://travis-ci.com/Justintime50/apache-php-docker.svg?branch=master)](https://travis-ci.com/Justintime50/apache-php-docker)
[![Docker Version](https://img.shields.io/docker/v/justintime50/apache-php)](https://hub.docker.com/repository/docker/justintime50/apache-php)
[![Image Size](https://img.shields.io/docker/image-size/justintime50/apache-php)](https://hub.docker.com/repository/docker/justintime50/apache-php)
[![Docker Pulls](https://img.shields.io/docker/pulls/justintime50/apache-php)](https://hub.docker.com/repository/docker/justintime50/apache-php)
[![Licence](https://img.shields.io/github/license/justintime50/apache-php-docker)](LICENSE)

</div>

This image has `msmtp` installed and configured to send mail locally for testing via apps like `Mailcatcher` which will work out of the box (if Mailcatcher container is titled `mailcatcher`). This image also has `mysql_pdo` enabled to use with a `database`. There is a sample `php.ini` file in the `config` folder. Additionally, there is a sample `.htaccess` file in the `src` folder which will remove `.php` file extensions from URLs.

## Usage

```bash
# Dockerfile usage
FROM: justintime50/apache-php:latest

# docker-compose usage
image: justintime50/apache-php:latest
```

## Docker Tags

- `latest` - uses the latest explicitly requested release on the PHP Apache track.
- `7.4` - uses the latest release on the PHP 7.4 Apache track.
- `7.3` - uses the latest release on the PHP 7.3 Apache track.
- `7.2` - uses the latest release on the PHP 7.2 Apache track.
- `7.1` - uses the latest release on the PHP 7.1 Apache track. - `Deprecated`
- `7.0` - uses the latest release on the PHP 7.0 Apache track. - `Deprecated`
- `dev` - the testing branch for this image. Do not use this tag in production.

## Building New Versions

This image supports swapping in the version number of PHP with a value from the official PHP Apache [tag list](https://hub.docker.com/_/php).

### Automated Builds

Travis CI will automatically build and push supported tags to the Docker Hub on each new commit to master.

### Manual Builds

```bash
docker build -t justintime50/apache-php:7.3 --build-arg VERSION=7.3 .

sudo docker push justintime50/apache-php:7.3
```
