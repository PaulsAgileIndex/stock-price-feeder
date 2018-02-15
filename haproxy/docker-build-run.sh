#!/bin/bash -x

CONSUL_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' consul-local-agent)

docker build -t avoodoo/haproxy:1.0-SNAPSHOT .

docker kill haproxy
docker rm haproxy
docker run \
	-itd \
	--network=bridge \
	--rm \
	--name haproxy \
	-p 1080:1080 \
	-p 1081:1081 \
	-p 9000:9000 \
	-e "CONSUL_NODE=$CONSUL_IP:8500" \
	avoodoo/haproxy:1.0-SNAPSHOT
	
#	-e "CONSUL_NODE=$CONSUL_IP:8500" \	
#	-e "CONSUL_NODE=localhost:8500" \