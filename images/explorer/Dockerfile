FROM php:7-apache
MAINTAINER AshDev <ashdevfr@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get update && \
    apt-get install -y git nodejs && \
    npm i -g gulp

RUN git clone https://github.com/AshDevFr/angular-filemanager.git /tmp/explorer && \
    mv /tmp/explorer/* /var/www/html/

RUN cd /var/www/html/ && \
   sed -i.bak -e 's/bridges\/php\/handler.php/bridges\/php-local\/index.php/g' src/js/providers/config.js && \
   sed -i.bak -e 's/new FileManagerApi()/new FileManagerApi("\/var\/www\/files", "en", false)/g' bridges/php-local/index.php

RUN cd /var/www/html/ && \
    npm i && \
    gulp build && \
    rm -rf node_modules

RUN mkdir -p /var/www/files && \
    chmod 777 /var/www/files

# create default user
RUN groupmod -g 1000 users && \
    useradd -u 911 -U -d /config -s /bin/false abc && \
    usermod -G users abc

ENV APACHE_RUN_USER abc
ENV APACHE_RUN_GROUP abc

COPY init.sh /
RUN chmod +x /init.sh

VOLUME /var/www/files

ENTRYPOINT []
CMD ["/init.sh"]
