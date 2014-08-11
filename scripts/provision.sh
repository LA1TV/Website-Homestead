#!/usr/bin/env bash

echo "Running custom setup script..."
/vagrant/scripts/phpmyadmin/install-phpmyadmin.sh

cd "$HOME"
cd "/home/vagrant/Code/LA1-Website"
echo "Executing 'composer self-update'"
composer self-update
echo "Executing 'composer install'"
composer install
echo "Setting up the database and seeding it."
php artisan migrate --seed
echo "Setting 'upload_max_filesize' and 'post_max_size' in 'php.ini'."
CONFIG_FILE="/etc/php5/fpm/php.ini"
VAL="1000M"
sed -i "s/\(upload_max_filesize *= *\).*/\1$VAL/" "$CONFIG_FILE"
sed -i "s/\(post_max_size *= *\).*/\1$VAL/" "$CONFIG_FILE"
echo "Setting 'client_max_body_size' for nginx."
CONFIG_FILE="/etc/nginx/conf.d/upload_size.conf"
VAL="1000m"
echo "client_max_body_size $VAL;" > "$CONFIG_FILE"
echo "Restarting nginx."
service php5-fpm stop
service nginx restart
service php5-fpm start
cd "$HOME"
echo "Finished custom setup script."