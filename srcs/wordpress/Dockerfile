FROM alpine:3.12.3

RUN apk update && apk upgrade
RUN apk add nginx  wget
RUN apk add php7 supervisor
RUN apk add php7-fpm
RUN apk add php7-mysqli
RUN apk add php7-json
RUN apk add php7-mbstring
RUN apk add php7-session

COPY ./nginxwp /etc/nginx/conf.d/default.conf
COPY ./wordpress.sh /tmp/
RUN  chmod +x /tmp/wordpress.sh
RUN  mkdir -p /run/nginx
COPY supervisord.conf /etc/supervisord.conf
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN mv wordpress/ /var/www/
COPY wp-config.php /var/www/wordpress/

EXPOSE 5050

CMD [ "sh", "/tmp/wordpress.sh" ]