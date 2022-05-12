FROM php:7.2-apache

SHELL ["/bin/bash", "--login", "-c"]

RUN apt update && \
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && \
	. "$HOME/.nvm/nvm.sh"

RUN nvm install 7.2

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN set -ex && \
	chmod +x /usr/local/bin/install-php-extensions && \
	install-php-extensions gd mysqli pdo_mysql pdo_pgsql \
	curl exif fileinfo intl mbstring mongodb openssl pgsql redis sockets xsl \
	bcmath calendar zip

RUN curl -sS https://getcomposer.org/installer | php -- --version=2.2.12 --install-dir=/usr/local/bin --filename=composer
