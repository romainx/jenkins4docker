#!/bin/sh 

# Run Jenkins ----
# - expose docker
# - persist jenkins_home in the host under /tmp/jenkins_home
#/var/jenkins_home/workspace

docker run -v /var/run/docker.sock:/var/run/docker.sock \
           -v $(which docker):/usr/bin/docker \
           -v /tmp/jenkins_home:/var/jenkins_home \
           -p 8080:8080 -p 50000:50000 \
           sk/jenkins4docker:latest