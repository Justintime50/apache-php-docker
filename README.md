# Apache/PHP Docker Image

[![Build Status](https://travis-ci.org/Justintime50/apache-php-docker.svg?branch=master)](https://travis-ci.org/Justintime50/apache-php-docker)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

A combined Apache/PHP Docker image.

This image has `msmtp` installed and configured to send mail locally for testing via apps like `Mailcatcher`. It also has `mysql_pdo` enabled to use with a `database`.

## Usage

Call this image from a Dockerfile or docker-compose file to easily deploy a single Nginx/PHP-FPM Docker container.

```bash
FROM: justintime50/apache-php:latest

OR 

image: justintime50/apache-php:latest
```

## Docker Tags

- `latest` - uses the latest explicitly requested release on the PHP Apache track.
- `7.4` - uses the latest release on the PHP 7.4 Apache track.
- `7.3` - uses the latest release on the PHP 7.3 Apache track.
- `7.2` - uses the latest release on the PHP 7.2 Apache track.
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
