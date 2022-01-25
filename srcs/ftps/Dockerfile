FROM alpine:3.12.3

RUN apk update
RUN apk add vsftpd openssl
COPY vsftpd.conf /etc/vsftpd/
RUN mkdir -p /etc/ftps/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/ftps/ssl/lkarine.key -out /etc/ftps/ssl/lkarine.crt  -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=fuck/CN=lkarine"

RUN echo "root:root" | chpasswd
COPY ./ftps.sh /tmp/
RUN  chmod +x /tmp/ftps.sh
EXPOSE 21 
CMD [ "sh", "/tmp/ftps.sh" ]
