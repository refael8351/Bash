#!/bin/bash

sudo wget -nc https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz
tar xvfz prometheus-*.tar.gz
cd prometheus-*
cat prometheus.yml
./prometheus --config.file=prometheus.yml
