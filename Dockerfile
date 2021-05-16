FROM composer AS composer
FROM php:fpm-alpine
ARG SIMA_LOGIN
ARG SIMA_PASS
ENV SIMA_LOGIN=${SIMA_LOGIN}
ENV SIMA_PASS=${SIMA_PASS}
WORKDIR /app
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apk update && apk add git curl wget bash jq
ADD ./api-php-client .
ADD entrypoint.sh .
# RUN git clone https://github.com/sima-land/api-php-client.git .
RUN composer install
EXPOSE 3000
ENTRYPOINT [ "sh", "entrypoint.sh" ]