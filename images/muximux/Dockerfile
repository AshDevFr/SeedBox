FROM linuxserver/muximux
MAINTAINER AshDev <ashdevfr@gmail.com>

COPY settings.ini.php /config/www/muximux/

RUN sed -i.bak -e 's/__SERVERNAME__/'"${SERVERNAME:-localhost.local}"'/g' /config/www/muximux/settings.ini.php
