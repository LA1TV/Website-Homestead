#!/usr/bin/env bash

echo "Installing phpMyAdmin..."
cd "/etc"
rm -rf "phpmyadmin"
mkdir "phpmyadmin"
cd "phpmyadmin"
echo "Cloning latest repository commit from STABLE branch. This may take a while."
git clone --branch RELEASE_4_2_13_1 --depth=1 https://github.com/phpmyadmin/phpmyadmin.git .
echo "Cloned."
echo "Creating config file..."
cp "/vagrant/scripts/phpmyadmin/config.inc.php" "config.inc.php"
echo "Created config file."
echo "Installed phpMyAdmin."
echo "Setting up with nginx..."
rm "/etc/nginx/sites-enabled/phpmyadmin"
rm "/etc/nginx/sites-available/phpmyadmin"
cp "/vagrant/scripts/phpmyadmin/phpmyadmin" "/etc/nginx/sites-available/phpmyadmin"
ln -s "/etc/nginx/sites-available/phpmyadmin" "/etc/nginx/sites-enabled/phpmyadmin"
echo "Set up with nginx."
echo "Restarting nginx..."
service nginx restart
echo "Restarted nginx."
echo "phpMyAdmin installed and accessible on port 3406."
