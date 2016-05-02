#!/usr/bin/env bash
echo "Starting queue listeners..."
cd "/home/vagrant/Code/LA1-Website"
php artisan queue:listen &
php artisan queue:listen --queue=uploadTransfer --timeout=600 &
php artisan queue:listen --queue=smartCache --timeout=60 &
echo "Started queue listeners."