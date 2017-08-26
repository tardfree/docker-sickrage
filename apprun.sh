#!/bin/sh

# check if config exists in /config, create a file if not
if [ ! -e /config/config.ini ]; then
	touch /config/config.ini
fi

python2 /app/SickBeard.py --datadir /config --config /config/config.ini --nolaunch
