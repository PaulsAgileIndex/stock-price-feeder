#!/bin/bash -x



docker kill consul-local-agent
docker rm consul-local-agent
## With a volume created on your local machine (host)
#export CONSUL_HOST_VOLUME=/var/data/consul/data
#mkdir -p $CONSUL_HOST_VOLUME
#rm -f $CONSUL_HOST_VOLUME/raft/peers.json
#docker run --name=consul-local-agent --network=bridge -itd -p 8400:8400 -p 8500:8500 -p 8600:53/udp -v $CONSUL_HOST_VOLUME:/data -h consul-local-agent progrium/consul -server -bootstrap -ui-dir /ui

docker start consul-local-agent

## Without a volume on the host
docker run \
	--name consul-local-agent \
	--network=bridge \
	-itd -p 8400:8400 \
	-p 8500:8500 \
	-p 8600:53/udp \
	--hostname consul-local-agent progrium/consul \
	-server \
	-bootstrap \
	-ui-dir /ui \
	

# --network=host \	
