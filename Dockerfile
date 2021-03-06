FROM jenkins/jenkins:lts

# Metadata ----
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL maintainer="xx@dev.com" \
      org.opencontainers.image.title="Jenkins4Docker" \
      org.opencontainers.image.description="A Jenkins setup to build docker images" \
      org.opencontainers.image.source="" \
      org.opencontainers.image.vendor="" \
      org.opencontainers.image.ref.name="sk/jenkins4docker" \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.version=$BUILD_VERSION \
      org.opencontainers.image.revision=$VCS_REF

# Docker configuration ----
#  /!\ It's a hack to run docker in docker
# Refs:
# - https://container-solutions.com/running-docker-in-jenkins-in-docker/
USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers  &&\
    echo "alias docker='sudo docker'" >> /etc/profile.d/00-aliases.sh

# Jenkins user
USER ${user}

# Plugin installation ----
# Refs: 
# - https://stackoverflow.com/questions/29328278/installing-jenkins-plugins-to-docker-jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# Jenkins configuration as code ----
# Refs:
# - https://github.com/jenkinsci/configuration-as-code-plugin

# Defining configuration hom
#ENV CASC_JENKINS_CONFIG="/var/jenkins_home/casc_configs"
#RUN mkdir -p "${CASC_JENKINS_CONFIG}"
