FROM nginx:1.11-alpine
MAINTAINER AshDev <ashdevfr@gmail.com>

RUN apk add --no-cache apache2-utils openssl

VOLUME /config

EXPOSE 80 443

ENV USERNAME=user \
    PASSWORD=hunter2 \
    USE_SSL=false

COPY nginx.conf common_default.conf ssl.conf /etc/nginx/
COPY init.sh /

CMD ["/init.sh"]
