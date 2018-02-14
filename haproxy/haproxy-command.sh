#!/bin/bash


HAPROXY="/etc/haproxy"
PIDFILE="/var/run/haproxy.pid"
CONFIG_FILE=${HAPROXY}/haproxy.cfg
cd "${HAPROXY}"

haproxy -f "${CONFIG_FILE}" -p "${PIDFILE}" -D -st $(cat ${PIDFILE})



