#!/bin/bash


java -jar ${SPRING_BOOT_HOME}/${ARTIFACT_NAME}.${ARTIFACT_FILE_EXTENSION} --spring.profiles.active=${STAGE} --spring.config.location=${SPRING_BOOT_HOME}/config  >> ${SPRING_BOOT_HOME}/start-spring-boot.log 2>&1