FROM alpine:3.12.3

RUN apk update && apk upgrade
RUN apk add wget openssh 
RUN wget https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.2.0.linux-amd64.tar.gz
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk
RUN mv grafana-7.2.0 grafana
RUN mv grafana /etc/
COPY ./start_server.sh /tmp/
COPY ./dashboards.yaml /etc/grafana/conf/provisioning/dashboards/
COPY ./datasourse.yaml /etc/grafana/conf/provisioning/datasources/
COPY ./dashboards/. /var/lib/grafana/dashboards

#RUN /etc/grafana/bin/defaults.ini /etc/grafana/bin/defaults.ini 
RUN  chmod +x /tmp/start_server.sh
#WORKDIR etc/grafana/bin
CMD ["/tmp/start_server.sh"]
#CMD ["./grafana-server"]