FROM registry.gitlab.com/clarin-eric/docker-alpine-base:2.3.3

# Alpine package dependencies
RUN apk add --no-cache \
		'py3-pip=22.3.1-r1'

# Install mkdocs
RUN pip install wheel && \
	pip install \
		mkdocs \
		mkdocs-material

ENTRYPOINT [ "/usr/bin/mkdocs" ]
CMD []
