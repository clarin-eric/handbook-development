FROM registry.gitlab.com/clarin-eric/docker-alpine-base:2.4.1

ARG MDL_VERSION=0.12.0

WORKDIR /tmp

RUN apk add --no-cache \
		git \
		ruby \
	&& gem install \
		rake \
		bundler \
	&& git clone -b "v${MDL_VERSION}" https://github.com/markdownlint/markdownlint \
	&& (cd markdownlint && rake install) \
	&& rm -rf ./markdownlint \
	&& gem uninstall rake bundler

WORKDIR /work

ENTRYPOINT ["/usr/bin/mdl"]

CMD ["."]
