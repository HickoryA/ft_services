FROM alpine:3.12.3

RUN apk update && apk upgrade
RUN apk add influxdb supervisor
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar xf telegraf-1.17.0_linux_amd64.tar.gz
RUN mv telegraf-1.17.0 telegraf
COPY ./startinf.sh /tmp/
COPY telegraf.conf /tmp/
RUN mkdir /etc/telegraf
COPY supervisord.conf /etc/supervisord.conf
RUN cp /tmp/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./influxdb.conf /etc/influxdb.conf
#если не будет работать, попробуй запустить с дефолтным конфигом
RUN  chmod +x /tmp/startinf.sh
CMD ["/tmp/startinf.sh"]
