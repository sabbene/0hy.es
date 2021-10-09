#!/bin/sh
set -e

PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

nginx -c /app/conf/nginx.conf
