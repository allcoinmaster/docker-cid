FROM jeanblanchard/java:jre-8
LABEL MAINTAINER Xing Chain <dev@chainid.io>
LABEL version="1.11.13"

ENV NRSVersion=1.11.13

RUN \
  apk update && \
  apk add wget gpgme && \
  mkdir /nxt-boot && \
  mkdir /cid && \
  cd /

ADD scripts /nxt-boot/scripts

VOLUME /cid
WORKDIR /nxt-boot

ENV NXTNET main	

COPY ./nxt-main.properties /nxt-boot/conf/
COPY ./nxt-test.properties /nxt-boot/conf/
COPY ./init-nxt.sh /nxt-boot/

EXPOSE 6868 6969 6789 8888 9999

CMD ["/nxt-boot/init-nxt.sh", "/bin/sh"]
