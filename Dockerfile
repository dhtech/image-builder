FROM debian:sid

RUN echo "deb-src http://deb.debian.org/debian sid main" >> /etc/apt/sources.list

RUN DEBIAN_FRONTEND=noninteractive apt-get update; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y dumb-init git curl; \ 
	DEBIAN_FRONTEND=noninteractive apt-get build-dep -y debian-installer

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
