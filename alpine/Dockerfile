ARG BASE_IMAGE="alpine:3"

FROM ${BASE_IMAGE}

USER root

RUN apk add --update --no-cache curl unzip \
 && rm -rf /var/cache/apk/* \
 && curl -fsSLo /tmp/install.sh https://deno.land/x/install/install.sh \
 && chmod +x  /tmp/install.sh

RUN addgroup -g 1000 deno \
 && adduser -G deno -s /bin/sh -D deno -u 1000

USER deno

RUN /tmp/install.sh
