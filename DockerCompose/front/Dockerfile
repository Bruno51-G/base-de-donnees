## syntax=docker/dockerfile:1.5.1
FROM php:8.5.0RC4-apache-trixie

SHELL [ "/bin/bash", "-xeuo", "pipefail", "-O", "lastpipe", "-c" ]

RUN <<eos
apt-get update
declare -ar packages=(
	libmemcached-dev
	libssl-dev
	zlib1g-dev
)
apt-get install -y ${packages[@]}

pecl install memcached-3.4.0
docker-php-ext-enable memcached
eos

COPY . /var/www/html
