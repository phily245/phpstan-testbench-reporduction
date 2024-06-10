FROM php:8.2-alpine AS apio
RUN apk add --update git \
    zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY ./ /app/

RUN composer install;

STOPSIGNAL SIGTERM

ENTRYPOINT ["tail", "-f", "/dev/null"]
