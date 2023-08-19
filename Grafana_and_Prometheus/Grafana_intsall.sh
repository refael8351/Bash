#!/bin/bash

sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana>
sudo apt-get update -y
sudo apt-get install grafana -y
sudo apt-get install grafana-enterprise -y
sudo systemctl start grafana-server
sudo systemctl status grafana-server | awk 'NR==2'


