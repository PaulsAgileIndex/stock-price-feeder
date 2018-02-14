#!/bin/bash -x


/usr/local/bin/consul-template/consul-template \
	-consul-addr=${CONSUL_NODE} \
	-template ${TEMPLATE}:${SPRING_BOOT_HOME}/config/application-${STAGE}.properties \
	-wait=5s:10s \
	-exec "$SPRING_BOOT_HOME/start-spring-boot.sh" \
	-log-level=debug >> ${SPRING_BOOT_HOME}/entrypoint.log 2>&1
	