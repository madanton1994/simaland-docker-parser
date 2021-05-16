FROM composer AS composer
FROM php:fpm-alpine
ENV SIMA_LOGIN=login
ENV SIMA_PASS=pass
WORKDIR /app
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apk update && apk add git curl wget bash jq
ADD ./api-php-client .
ADD entrypoint.sh .
# RUN git clone https://github.com/sima-land/api-php-client.git .
RUN composer install
EXPOSE 3000
ENTRYPOINT [ "sh", "entrypoint.sh" ]