FROM phusion/baseimage:0.9.22

MAINTAINER Frank Sprich <frank.sprich@gmail.com>

## Install Java
RUN \
	apt-get update && \
	apt-get install -y iputils-ping && \
    apt-get install -y openjdk-8-jre-headless && \
    apt-get clean && \
    java -version    
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre   

## Install Utilities
RUN apt-get update && \
	apt-get install -y wget curl unzip git && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



## Install consul-template
ENV CONSUL_TEMPLATE_VERSION 0.19.4
ENV CONSUL_TEMPLATE_FILE consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
ENV CONSUL_TEMPLATE_URL "https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/${CONSUL_TEMPLATE_FILE}"
ENV CONSUL_TEMPLATE_HOME /usr/local/bin/consul-template
WORKDIR ${CONSUL_TEMPLATE_HOME}
RUN \
	wget ${CONSUL_TEMPLATE_URL} && \
  	unzip ${CONSUL_TEMPLATE_FILE} && \
  	chmod a+x ${CONSUL_TEMPLATE_HOME} && \
  	rm -rf ${CONSUL_TEMPLATE_FILE}
  	
  	
## Install SpringBoot application
WORKDIR /opt/java/spring-boot 
ARG ARTIFACT_NAME
ARG ARTIFACT_FILE_EXTENSION
ENV ARTIFACT_NAME ${ARTIFACT_NAME} 
ENV ARTIFACT_FILE_EXTENSION ${ARTIFACT_FILE_EXTENSION} 
ENV SPRING_BOOT_HOME /opt/java/spring-boot
ENV SPRING_CONFIG_FILE ${SPRING_BOOT_HOME}/config/application-${STAGE}.properties
ADD target/${ARTIFACT_NAME}.${ARTIFACT_FILE_EXTENSION} ${SPRING_BOOT_HOME}/${ARTIFACT_NAME}.${ARTIFACT_FILE_EXTENSION}  
ADD src/main/docker/scripts/start-spring-boot.sh ${SPRING_BOOT_HOME}/start-spring-boot.sh
RUN chmod u+x ${SPRING_BOOT_HOME}/start-spring-boot.sh

#VOLUME /opt/java/spring-boot	
  	
ENV TEMPLATE ${SPRING_BOOT_HOME}/config/application-stage.properties.tpl
ADD src/main/docker/consul-template/application-stage.properties.tpl ${TEMPLATE}

ADD src/main/docker/scripts/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh 	

EXPOSE 8080
WORKDIR ${SPRING_BOOT_HOME}
ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT ["/bin/bash"]

## Install consul-template
#RUN mkdir -p /opt/consul-template/bin	
#ENV CONSUL_TEMPLATE_HOME /opt/consul-template/bin
#WORKDIR $CONSUL_TEMPLATE_HOME
#ENV CONSUL_TEMPLATE_HOME_VERSION 0.19.4
#ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_HOME_VERSION}/consul-template_${CONSUL_TEMPLATE_HOME_VERSION}_linux_amd64.zip $CONSUL_TEMPLATE_HOME/
#RUN unzip $CONSUL_TEMPLATE_HOME/consul-template_${CONSUL_TEMPLATE_HOME_VERSION}_linux_amd64.zip && \
#	rm -rf $CONSUL_TEMPLATE_HOME/consul-template_${CONSUL_TEMPLATE_HOME_VERSION}_linux_amd64.zip
#ENV PATH="${CONSUL_TEMPLATE_HOME}:${PATH}"	

## Install SpringBoot application
#WORKDIR /opt/java/spring-boot 
#ARG ARTIFACT_NAME
#ARG ARTIFACT_FILE_EXTENSION
#ENV ARTIFACT_NAME=${ARTIFACT_NAME} 
#ENV ARTIFACT_FILE_EXTENSION=${ARTIFACT_FILE_EXTENSION} 
#ENV SPRING_BOOT_HOME=/opt/java/spring-boot
#ENV GLOBAL_CONFIG $SPRING_BOOT_HOME/config/application-$STAGE.properties
#ADD target/${ARTIFACT_NAME}.${ARTIFACT_FILE_EXTENSION} $SPRING_BOOT_HOME/$ARTIFACT_NAME.$ARTIFACT_FILE_EXTENSION

## Add the template for consul-template
#ENV TEMPLATE=$SPRING_BOOT_HOME/config/tmpl/application-stage.properties.tpl
#ADD src/main/docker/config/consul-template/templates/application-stage.properties.tpl $TEMPLATE

#EXPOSE 8080

## Start consul-template and start/supervise the SpringBoot application
#ADD src/main/docker/service/start-app/start.sh start.sh
#RUN chmod +x start.sh
#ENTRYPOINT ["/opt/java/spring-boot/start.sh"]