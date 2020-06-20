ARG BASE_IMAGE="buildpack-deps:bionic-curl"

FROM ${BASE_IMAGE}

USER root

RUN curl -fsSLo /tmp/install.sh https://deno.land/x/install/install.sh \
 && chmod +x  /tmp/install.sh \
 && apt-get update -qq \
 && apt-get install --no-install-recommends -qqy unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 deno \
 && useradd -g 1000 -l -m -s /bin/bash -u 1000 deno

USER deno

ENV PATH="/home/deno/.deno/bin:${PATH}"

RUN /tmp/install.sh

USER root

RUN rm -rf /tmp/*

USER deno
