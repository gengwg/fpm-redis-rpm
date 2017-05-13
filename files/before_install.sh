#!/bin/sh
# before_install
set -e
if ! id -u redis &> /dev/null; then
	/usr/sbin/useradd -s /bin/false -r -U -M redis
fi

#mkdir -p /opt/redis/log
#chown redis:redis /opt/redis/log

#mkdir -p /app/redis
#chown redis:redis /app/redis
