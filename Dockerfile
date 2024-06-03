FROM alpine

RUN apk add --update apache2-utils \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

LABEL maintainer = "Konstantin Kruglov <kruglovk@bidease.com>"
LABEL org.opencontainers.image.source = "https://github.com/bidease/pwd"
