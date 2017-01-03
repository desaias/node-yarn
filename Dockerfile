FROM alpine:3.5

MAINTAINER Dave <git@davidesaias.com>

RUN apk add --update --no-cache nodejs \
	&& touch ~/.bashrc \
	&& apk add --no-cache --virtual .build-deps-yarn tar curl bash gnupg \
	&& curl -o- -L https://yarnpkg.com/install.sh | bash \
	&& apk del .build-deps-yarn \
	&& npm uninstall -g npm \
	&& rm -rf ~/.gnupg ~/.npm

ENV PATH /root/.yarn/bin:$PATH
