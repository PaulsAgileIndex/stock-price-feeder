#!/bin/bash


HAPROXY="/etc/haproxy"
PIDFILE="/var/run/haproxy.pid"
CONFIG_FILE=${HAPROXY}/haproxy.cfg

cd "$HAPROXY"

haproxy -f "$CONFIG_FILE" -p "$PIDFILE" -D -st $(cat $PIDFILE)

/usr/local/bin/consul-template/consul-template \
	-consul-addr=${CONSUL_NODE} \
	-config=/consul.hcl
	
	
	#-template /etc/haproxy/haproxy.tpl:/etc/haproxy/haproxy.cfg \
	#-exec "/haproxy-exec.sh" 
