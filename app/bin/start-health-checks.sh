#!/bin/sh
set -e

PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

now=$(date "+%s")
one_hour_seconds='3600'

function error_exit {
    echo "${1}"
    exit 1
}

function tides_checks {
    tides_html_file='/app/www/html/tides/index.html'

    ## tides checks
    if [[ ! -e "${tides_html_file}" ]]
    then
        error_exit "ERROR: gile does not exist: ${tides_html_file}"
    else
        tides_html_ctime=$(stat -c '%Y' "${tides_html_file}")
        tides_delta=$(expr "${now}" - "${tides_html_ctime}")

        if [[ "${tides_delta}" -ge "${one_hour_seconds}" ]]
        then
            error_exit 'ERROR: tides has not updated in more than 1 hour'
        fi
    fi
}

function nginx_checks {
    if ! pgrep nginx 1>/dev/null 2>&1
    then
        error_exit 'ERROR: nginx not running'
    elif ! nc -z 127.0.0.1 80
    then
        error_exit 'ERROR: port 80 not resonding'
    fi
}

## MAIN ##

while true
do
    tides_checks()
    nginx_checks()
    sleep 10m;
done
