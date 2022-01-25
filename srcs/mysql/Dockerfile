FROM alpine:3.12.3

RUN apk update
RUN apk add mariadb mariadb-client openrc
COPY ./my.cnf /etc/mysql/
COPY ./create.sql /var/
COPY ./wordpress.sql /var/
COPY mysql.sh /var/

EXPOSE 3306

CMD [ "sh", "/var/mysql.sh" ]