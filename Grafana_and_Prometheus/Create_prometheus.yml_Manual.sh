#!/bin/bash

touch prometheus.yml
echo 'global:' | cat > prometheus.yml
echo '  scrape_interval:     15s # By default, scrape targets every 15 seconds.\n' | cat >> prometheus.yml
echo '  external_labels: ' | cat >> prometheus.yml
echo "  monitor: 'codelab-monitor'" | cat >> prometheus.yml
echo "scrape_configs:" | cat >> prometheus.yml
echo "  - job_name: 'prometheus'" | cat >> prometheus.yml
echo "    scrape_interval: 5s\n" | cat >> prometheus.yml
echo "    static_configs:" | cat >> prometheus.yml
echo "      - targets: ['localhost:9090']" | cat >> prometheus.yml
#echo "" | cat >> prometheus.yml



cat prometheus.yml
