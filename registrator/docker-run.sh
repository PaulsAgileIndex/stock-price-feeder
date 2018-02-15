#!/bin/bash -x


docker build -t avoodoo/registrator:1.0-SNAPSHOT .

docker kill registrator
docker rm registrator

CONSUL_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.Gateway}}{{end}}' consul-local-agent)

docker run -d \
  --name=registrator \
  --net=bridge \
  --volume=/var/run/docker.sock:/tmp/docker.sock \
	avoodoo/registrator:1.0-SNAPSHOT \
	consul://$CONSUL_IP:8500
	
	
#consul://$CONSUL_IP:8500	
#consul://localhost:8500
#gliderlabs/registrator:latest
#avoodoo/registrator:1.0-SNAPSHOT