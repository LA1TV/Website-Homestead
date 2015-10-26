#!/usr/bin/env bash
echo "Installing elasticsearch..."

# elastic search requires java
apt-get update && apt-get install default-jre -y

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-1.7.list
apt-get update && apt-get install elasticsearch -y
# start on boot
update-rc.d elasticsearch defaults 95 10
# run now
service elasticsearch start
echo "Installed elasticsearch."