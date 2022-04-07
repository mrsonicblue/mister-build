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

# RUN set -ex; \
#     wget --no-verbose https://github.com/LMDB/lmdb/archive/LMDB_0.9.29.tar.gz; \
#     tar xfz LMDB_0.9.29.tar.gz; \
#     rm LMDB_0.9.29.tar.gz; \
#     mv lmdb-LMDB_0.9.29 lmdb; \
#     cd lmdb/libraries/liblmdb; \
#     make CC=armv7-unknown-linux-gnueabi-gcc AR=armv7-unknown-linux-gnueabi-ar liblmdb.a;


WORKDIR /project