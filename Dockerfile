FROM centos:centos7
MAINTAINER Ruud Zuiderlicht ruudw@zuiderlicht.nl, Przemyslaw Ozgo linux@ozgo.info, Marcin Ryzycki marcin@m12.io

RUN yum update -y && \
  yum install -y epel-release && \
  yum install -y varnish && \
  yum install -y libmhash-devel && \
  yum clean all

ADD start.sh /start.sh
ADD reload.sh /reload.sh

# Set the control terminal to be wide open by default, with no secret file.
ENV VARNISH_ADMIN_LISTEN_ADDRESS 0.0.0.0
ENV VARNISH_ADMIN_LISTEN_PORT 6082

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      64m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

CMD /start.sh
EXPOSE 80
EXPOSE 6082
