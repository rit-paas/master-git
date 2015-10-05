FROM docker.io/openshift/base-centos7:latest
MAINTAINER Udo Urbantschitsch udo@urbantschitsch.com

RUN \
  yum install -y haproxy && \ 
  yum clean all && \
  groupadd -g 1001 default && \
  chown -R default:default /var/lib/haproxy


COPY container-files /

ENV HAPROXY_CONFIG /etc/haproxy/haproxy.cfg

EXPOSE 8080

USER 1001

ENTRYPOINT ["haproxy"]

CMD ["-f", "/etc/haproxy/haproxy.cfg"]
