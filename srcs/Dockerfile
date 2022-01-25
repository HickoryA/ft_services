FROM alpine:3.12.3

RUN apk update --no-cache && apk upgrade
RUN apk add nginx openssl openssh supervisor

COPY ./nginx-localhost /etc/nginx/conf.d/default.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/lkarine.key -out /etc/nginx/ssl/lkarine.crt  -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=fuck/CN=lkarine"
#RUN adduser -D admin && echo "admin:admin" | chpasswd
RUN adduser -D lkarine && echo "lkarine:fuck" | chpasswd
#RUN echo "root:root" | chpasswd
COPY supervisord.conf /etc/supervisord.conf
COPY ./start_server.sh /tmp/
RUN ssh-keygen -A
RUN  chmod +x /tmp/start_server.sh
RUN  mkdir -p /run/nginx
EXPOSE 80 443 22
CMD ["/tmp/start_server.sh"]
