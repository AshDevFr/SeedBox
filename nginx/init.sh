#!/bin/sh

# Make placeholder config directory
mkdir -p /config/nginx/logs

# Set basic auth credentials
htpasswd -cb /etc/nginx/.htpasswd $USERNAME $PASSWORD

# Replace common.conf with default
cp -f /etc/nginx/common_default.conf /etc/nginx/common.conf

${USE_SSL:=false}
if $USE_SSL ; then
    echo "include ssl.conf;" >> /etc/nginx/common.conf

    # Create self-signed certificate if using ssl and keys do not exist.
    # You can always replace these with your own keys later.
    if [[ ! -f /config/nginx/ssl.key || ! -f /config/nginx/ssl.crt ]]; then
      openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
        -subj "/C=SB/ST=Seedbox/L=Seedbox/O=Seedbox/CN=$1" \
        -keyout /config/nginx/ssl.key  -out /config/nginx/ssl.crt
    fi
fi

exec nginx -g "daemon off;"
