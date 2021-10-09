#!/bin/sh
set -e

PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

tmp_file='/app/www/html/tides/index.html.tmp'
prod_file='/app/www/html/tides/index.html'


echo LOADING > "${prod_file}"
echo $(date +"%Y-%m-%dT%H:%M:%S%z") >> "${prod_file}"

while true;
do
    cd /app/src/tides
    carton run ./tides.pl > "${tmp_file}";

    if [[ -s "${tmp_file}" ]]
    then
        ts=$(date +"%Y-%m-%dT%H:%M:%S%z")
        cat "${tmp_file}" > "${prod_file}"
	echo '<br>' >> "${prod_file}"
        echo "UPDATED: ${ts}" >> "${prod_file}"
        rm -f "${tmp_file}"
    else
        echo 'ERROR: UNABLE TO UPDATE FORECAST'
        exit 1
    fi

    sleep 30m;
done
