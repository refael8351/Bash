#!/bin/bash

# Check whether we have sufficient privileges

if [ $(id -u) -ne 0 ]; then
	echo "This script needs to be run as root" >&2
	exit 1
else
	curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sh
	wget --delete-after http://192.168.1.168/nagiosxi
fi
