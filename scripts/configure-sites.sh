#!/usr/bin/env bash

block="server {
    listen 80;
    server_name www.la1tv.co.uk.local embed.la1tv.co.uk.local;
    root /home/vagrant/Code/LA1-Website/public;

    index index.html index.htm index.php;

    charset utf-8;

    location /assets/built {
        alias /home/vagrant/Code/LA1-Website/app/assets/builds;
    }

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/www.la1tv.co.uk.local-error.log error;

    error_page 404 /index.php;

    sendfile off;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
"

echo "$block" > "/etc/nginx/sites-available/www.la1tv.co.uk.local"
ln -fs "/etc/nginx/sites-available/www.la1tv.co.uk.local" "/etc/nginx/sites-enabled/www.la1tv.co.uk.local"
