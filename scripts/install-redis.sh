#!/usr/bin/env bash
echo "Installing redis..."
apt-get update
apt-get install -y redis-server
echo "Installed redis."