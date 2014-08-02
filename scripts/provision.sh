#!/usr/bin/env bash
echo "Running custom setup script..."
cd "/home/vagrant/Code/LA1-Website"
composer install
php artisan migrate --seed
cd "$HOME"
echo "Finished custom setup script."