FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
EXPOSE 3003
WORKDIR /var/www/html
COPY index.php /var/www/html/index.php
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]


FROM php
COPY ./index.php ./
EXPOSE 3003
CMD [ "php", "-S", "0.0.0.0:3003" ]


