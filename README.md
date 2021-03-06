<div align="center">

# Apache/PHP Docker Image

A combined Apache/PHP Docker image.

[![Build Status](https://github.com/Justintime50/apache-php-docker/workflows/build/badge.svg)](https://github.com/Justintime50/apache-php-docker/actions)
[![Image Size](https://img.shields.io/docker/image-size/justintime50/apache-php)](https://hub.docker.com/repository/docker/justintime50/apache-php)
[![Docker Pulls](https://img.shields.io/docker/pulls/justintime50/apache-php)](https://hub.docker.com/repository/docker/justintime50/apache-php)
[![Licence](https://img.shields.io/github/license/justintime50/apache-php-docker)](LICENSE)

</div>

# Features

* `PHP`
* `Apache` with mode rewrites enabled
* `msmtp` is installed and configured (see `config/msmtprc`) to send mail locally for testing via apps like `Mailcatcher` which will work out of the box (if Mailcatcher container is titled `mailcatcher`)f 
* `mysql_pdo` is installed as the driver for database connections
* `gd` is installed for image processing
* `zip` is installed for items that may need that

## Install

```bash
# Dockerfile
FROM: justintime50/apache-php:latest

# docker-compose
image: justintime50/apache-php:latest
```

## Usage

Place your site files into `/var/www/html` inside the container to get started with this image. This can be achieved by using a volume in a `docker-compose` file or by copying them in a `Dockerfile`.

Want to give this image a spin? Simply run the following:

```bash
docker-compose up -d
```

### Apache Configuration

There is a sample `php.ini` file in the `config` folder. Additionally, there is a sample `.htaccess` file in the `src` folder which will remove `.php` file extensions from URLs.

## Docker Tags

- `latest` - uses the latest explicitly requested release on the PHP Apache track.
- `8.0` - uses the latest release on the PHP 8.0 Apache track.
- `7.4` - uses the latest release on the PHP 7.4 Apache track.
- `7.3` - uses the latest release on the PHP 7.3 Apache track. - `Deprecated`
- `7.2` - uses the latest release on the PHP 7.2 Apache track. - `Deprecated`
- `7.1` - uses the latest release on the PHP 7.1 Apache track. - `Deprecated`
- `7.0` - uses the latest release on the PHP 7.0 Apache track. - `Deprecated`
- `dev` - the testing branch for this image. Do not use this tag in production.

## Building New Versions

This image supports swapping in the version number of PHP with a value from the official PHP Apache [tag list](https://hub.docker.com/_/php).

**Automated Builds**

GitHub Actions will automatically build and push supported tags to Docker Hub on each new release and Docker Hub will automatically build the `latest` tag on any push to the main branch.

**Manual Builds**

```bash
docker build -t justintime50/apache-php:8.0 --build-arg VERSION=8.0 .

sudo docker push justintime50/apache-php:8.0
```
