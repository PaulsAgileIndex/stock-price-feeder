#!/bin/bash


HAPROXY="/etc/haproxy"
PIDFILE="/var/run/haproxy.pid"
CONFIG_FILE=${HAPROXY}/haproxy.cfg
cd "${HAPROXY}"

## inotifywait events: close_write,moved_to,create
inotifywait -e close_write -m ${HAPROXY} |
while read -r directory events filename; do
  if [ "$filename" = "haproxy.cfg" ]; then
    echo "hallo I bims"
    haproxy -f "${CONFIG_FILE}" -p "${PIDFILE}" -D -st $(cat ${PIDFILE})
  fi
done


