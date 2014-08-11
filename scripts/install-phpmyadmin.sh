#!/usr/bin/env bash
echo "Installing phpMyAdmin..."
cd "/home/vagrant"
rm -rf "phpMyAdmin"
git clone https://github.com/phpmyadmin/phpmyadmin.git "phpMyAdmin"

cd "$HOME"
echo "Installed phpMyAdmin."