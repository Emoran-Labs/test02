FROM php
COPY ./index.php ./
EXPOSE 3003
CMD [ "php", "-S", "0.0.0.0:3003" ]


