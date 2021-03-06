FROM aarch64/debian:jessie-slim

ARG GOLANG_VERSION
ARG GOLANG_SRC_SHA256

ARG GOLANG_SRC_URL=https://golang.org/dl/go$GOLANG_VERSION.src.tar.gz

# https://golang.org/issue/14851
COPY no-pic.patch /
# https://golang.org/issue/17847
COPY 17847.patch /

RUN set -ex \
	&& echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests wget bash gcc openssl golang-1.7 ca-certificates patch libc-dev \
	&& export PATH=/usr/lib/go-1.7/bin:$PATH \
	&& export GOROOT_BOOTSTRAP="$(/usr/lib/go-1.7/bin/go env GOROOT)" \
	&& echo "${GOLANG_SRC_URL}" \
	\
	&& wget "${GOLANG_SRC_URL}" -O golang.tar.gz \
	&& echo "$GOLANG_SRC_SHA256  golang.tar.gz" | sha256sum -c - \
	&& tar -C /usr/local -xzf golang.tar.gz \
	&& rm golang.tar.gz \
	&& cd /usr/local/go/src \
        && patch -p2 -i /no-pic.patch \
        && patch -p2 -i /17847.patch \
	&& export GOROOT_BOOTSTRAP="$(/usr/lib/go-1.7/bin/go env GOROOT)" \ 
	&& ./make.bash \
	&& rm -rf /*.patch \
	&& echo "Yes, do as I say!" | apt-get purge -y --force-yes  wget bash gcc openssl golang-1.7 patch libc-dev\
	&& apt-get autoremove -y


ENV GOPATH /usr/lib/go-1.7/
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

COPY go-wrapper /usr/local/bin/
