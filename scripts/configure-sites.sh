#!/usr/bin/env bash

block="server {
    listen 80;
    server_name local.www.la1tv.co.uk local.embed.la1tv.co.uk;
    root /home/vagrant/Code/LA1-Website/public;

    index index.html index.htm index.php;

    charset utf-8;
	
    location /assets/scripts {
        alias /home/vagrant/Code/LA1-Website/app/assets/scripts;
    }
	
	location /assets/css {
        alias /home/vagrant/Code/LA1-Website/app/assets/css;
    }
	
    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/local.www.la1tv.co.uk-error.log error;

    error_page 404 /index.php;

    sendfile off;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
"

echo "$block" > "/etc/nginx/sites-available/local.www.la1tv.co.uk"
ln -fs "/etc/nginx/sites-available/local.www.la1tv.co.uk" "/etc/nginx/sites-enabled/local.www.la1tv.co.uk"
