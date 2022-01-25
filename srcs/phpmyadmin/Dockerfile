FROM alpine:3.12.3

RUN apk update
RUN apk add nginx openssl wget 
RUN apk add php7 supervisor
RUN apk add php7-fpm
RUN apk add php7-mysqli
RUN apk add php7-json
RUN apk add php7-mbstring
RUN apk add php7-session 
COPY ./nginxphp /etc/nginx/conf.d/default.conf

COPY supervisord.conf /etc/supervisord.conf
COPY ./phpmyadmin.sh /tmp/
RUN  chmod +x /tmp/phpmyadmin.sh
RUN  mkdir -p /run/nginx
RUN mkdir      /var/www/phpmyadmin


RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/phpmyadmin

COPY phpmyadmin.inc.php /var/www/phpmyadmin/config.inc.php
COPY ./phpmyadmin.sh /tmp/

EXPOSE 5000

CMD [ "sh", "/tmp/phpmyadmin.sh" ]