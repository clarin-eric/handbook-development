FROM registry.gitlab.com/clarin-eric/docker-alpine-base:2.6.9

# Install mkdocs
RUN apk add --no-cache 'py3-pip=23.3.1-r0' \
	&& python3 -m venv /mkdocs \
	&& . /mkdocs/bin/activate \
	&& pip install wheel \
	&& pip install mkdocs mkdocs-material

RUN echo -e \
	"#!/usr/bin/env bash\n" \
	"source /mkdocs/bin/activate && mkdocs \"\$@\"" \
	> /usr/local/bin/entrypoint.sh \
	&& chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD []
