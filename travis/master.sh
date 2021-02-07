#!/bin/bash

# Build and push all supported docker images to Docker Hub

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# PHP 8
docker build -t justintime50/apache-php:8.0 --build-arg VERSION=8.0 .
docker push justintime50/apache-php:8.0

# PHP 7.4
docker build -t justintime50/apache-php:7.4 --build-arg VERSION=7.4 .
docker push justintime50/apache-php:7.4

# PHP 7.3
docker build -t justintime50/apache-php:7.3 --build-arg VERSION=7.3 .
docker push justintime50/apache-php:7.3

# PHP 7.2
docker build -t justintime50/apache-php:7.2 --build-arg VERSION=7.2 .
docker push justintime50/apache-php:7.2

# PHP 7.1 (Deprecated)
docker build -t justintime50/apache-php:7.1 --build-arg VERSION=7.1 .
docker push justintime50/apache-php:7.1

# PHP 7.0 (Deprecated)
docker build -t justintime50/apache-php:7.0 --build-arg VERSION=7.0 .
docker push justintime50/apache-php:7.0
