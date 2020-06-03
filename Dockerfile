ARG KUBECTL_VERSION=

FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install sudo && rm -rf /var/lib/apt/lists/*
RUN apt-get -y update
RUN apt-get -y install curl
RUN if [ "$KUBECTL_VERSION" = "" ] ; then curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl ; else yarn curl --fail -LO https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl ; fi
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl