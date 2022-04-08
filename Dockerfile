FROM debian:bullseye-slim

# Build tools
RUN set -ex; \
    apt-get update ; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata; \
    apt-get install -y make libtool gettext wget xz-utils; \
    apt-get clean -y;

WORKDIR /opt

# gcc
RUN set -ex; \
    wget --no-verbose https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz; \
    tar xfJ gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz; \
    rm gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz;

ENV PATH="${PATH}:/opt/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf/bin"

WORKDIR /project