FROM ubuntu:vivid
MAINTAINER Natale Vinto <ebballon@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# https://github.com/docker-library/official-images/issues/1902
RUN sed -i 's/archive/old-releases/' /etc/apt/sources.list

RUN dpkg --add-architecture i386 
RUN apt-get update
RUN apt-get install -y firefox:i386 icedtea-7-plugin:i386 \
    openjdk-7-jre:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386 \
    libxft2:i386 libxmu6:i386 libxv1:i386 fonts-takao
RUN useradd -ms /bin/bash webex
USER webex
WORKDIR /home/webex
CMD /usr/bin/firefox
