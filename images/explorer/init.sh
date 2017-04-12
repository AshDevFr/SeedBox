#!/bin/sh

PUID=${PUID:-911}
PGID=${PGID:-911}

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc

docker-php-entrypoint apache2-foreground
