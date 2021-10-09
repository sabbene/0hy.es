#!/bin/sh
set -e

PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

/app/bin/start-nginx.sh;
/app/bin/start-tides.sh &
/app/bin/start-health-checks.sh

exit 1;
