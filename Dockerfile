FROM alpine:latest

RUN apk add --update apache2-utils && rm -rf /var/cache/apk/*
COPY LICENSE /LICENSE
COPY README.md /README.md
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

LABEL maintainer="Bidease Inc."
LABEL org.opencontainers.image.source="https://github.com/bidease/pwd"
