#!/bin/sh
set -e
set -x

PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

/app/bin/start-nginx.sh;
/app/bin/start-tides.sh &

## wait 60 sec before starting health checks
sleep 60

/app/bin/start-health-checks.sh

exit 1;
