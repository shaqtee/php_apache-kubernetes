FROM php:7.2-apache

#RUN apt update && apt install -y \
#	curl \
#	bash \
#	ca-certificates \
#	openssl \
#	ncurses \
#	coreutils \
#	python2 \
#	make \
#	gcc \
#	g++ \
#	libgcc \
#	linux-headers \
#	grep \
#	util-linux \
#	binutils \
#	findutils \
#	git \
#	zip \
#	unzip
#RUN apt update && apt install nodejs npm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN set -ex && \
	chmod +x /usr/local/bin/install-php-extensions && \
	install-php-extensions gd mysqli pdo_mysql pdo_pgsql \
	curl exif fileinfo intl mbstring mongodb openssl pgsql redis sockets xsl \
	bcmath calendar zip

RUN curl -sS https://getcomposer.org/installer | php -- --version=2.2.12 --install-dir=/usr/local/bin --filename=composer

#RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.14/main/ nodejs=14.19.0-r0
#RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ npm=8.14.0-r0

#EXPOSE 9000