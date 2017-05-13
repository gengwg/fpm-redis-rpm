#!/bin/bash
# after_remove
set -e
if pgrep "redis" &> /dev/null; then
    # redis is running
	if supervisorctl stop redis_server &> /dev/null; then
		if id -u redis &> /dev/null; then
			/usr/sbin/userdel redis
		fi
	else 
		kill `pgrep redis`
		/usr/sbin/userdel redis
	fi
fi
now=$(date +'%Y-%m-%d:%H:%M')
if [ -d "/opt/redis" ]; then
	mv -f /opt/redis /opt/redis_${now}
fi
