FROM phusion/baseimage:0.9.17
MAINTAINER Anton Tsitlionok <yukron@gmail.com>

CMD ["/sbin/my_init"]

ENV HOME /root
ADD . /build

RUN /build/utilities.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
