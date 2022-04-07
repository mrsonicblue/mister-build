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
    wget https://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz; \
    tar xfJ gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz; \
    rm gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz;

ENV PATH="${PATH}:/opt/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin"

WORKDIR /project