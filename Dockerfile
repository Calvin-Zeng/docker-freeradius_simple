FROM ubuntu:20.04

#Setting CONTAINER_TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive

# Install apt packages
RUN apt-get -y update && apt-get -y install \
	vim \
	freeradius \
	freeradius-utils \
	&& rm -rf /var/lib/apt/lists/*

# Default shell is bash
RUN echo "dash dash/sh boolean false" | debconf-set-selections && \
	dpkg-reconfigure -p critical dash
