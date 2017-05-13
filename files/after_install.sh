#!/bin/sh                                                                                                                                             
# after_install
set -e
mkdir -p /opt/redis/log && chown -R redis:redis /opt/redis
mkdir -p /app/redis && chown -R redis:redis /app/redis



