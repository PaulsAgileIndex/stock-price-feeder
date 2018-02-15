FROM phusion/baseimage:0.9.22

MAINTAINER Frank Sprich <frank.sprich@gmail.com>

RUN \
	apt-get update && \
	apt-get install -y iputils-ping && \
	apt-get install -y software-properties-common && \
	add-apt-repository ppa:vbernat/haproxy-1.6 && \
	apt-get update && \
	apt-get install -y wget curl unzip && \
	apt-get install -y haproxy && \
	apt-get install -y inotify-tools && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


## Install consul-template
ENV CONSUL_TEMPLATE_VERSION 0.19.4
ENV CONSUL_TEMPLATE_FILE consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
ENV CONSUL_TEMPLATE_URL "https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/${CONSUL_TEMPLATE_FILE}"
ENV CONSUL_TEMPLATE_HOME /usr/local/bin/consul-template

WORKDIR ${CONSUL_TEMPLATE_HOME}
RUN wget ${CONSUL_TEMPLATE_URL} && \
	unzip ${CONSUL_TEMPLATE_FILE} && \
	chmod a+x ${CONSUL_TEMPLATE_HOME} && \
  	rm -rf ${CONSUL_TEMPLATE_FILE}

ADD haproxy.cfg /etc/haproxy/haproxy.cfg

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ADD haproxy-command.sh /haproxy-command.sh
RUN chmod u+x /haproxy-command.sh

ADD haproxy.tpl /etc/haproxy/haproxy.tpl
ADD consul.hcl /consul.hcl

EXPOSE 1080 1081 9000

WORKDIR /

CMD ["/entrypoint.sh"]
