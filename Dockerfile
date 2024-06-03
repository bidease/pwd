FROM alpine

RUN apk add --update apache2-utils \
    && rm -rf /var/cache/apk/*

LABEL maintainer = "Konstantin Kruglov <kruglovk@bidease.com>"
LABEL org.opencontainers.image.source = "https://github.com/bidease/pwd"
