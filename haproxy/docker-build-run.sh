#!/bin/bash -x

docker build -t avoodoo/haproxy:1.0-SNAPSHOT .

CONSUL_GATEWAY_IP=$(docker inspect -f '{{range .IPAM.Config}}{{.Gateway}}{{end}}' ingress)
echo $CONSUL_GATEWAY_IP

CONSUL_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.Gateway}}{{end}}' consul-local-agent)
echo $CONSUL_IP

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