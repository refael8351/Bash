#!/bin/sh

# su root
if [ $(id -u) -ne 0 ]; then
	echo "This script needs to be run as root" >&2
	exit 1
else
	cd /tmp
	wget https://assets.nagios.com/downloads/nagiosxi/xi-latest.tar.gz
	tar xzf xi-latest.tar.gz
	cd nagiosxi
	./fullinstall
	wget --delete-after http://192.168.1.168/nagiosxi
fi