FROM jenkins/jenkins:lts

WORKDIR $JENKINS_HOME
COPY config.xml .
COPY credentials.xml .
COPY plugins.txt .
COPY jobs .
COPY scripts/init.groovy ./init.groovy.d/

RUN install-plugins.sh < $JENKINS_HOME/plugins.txt