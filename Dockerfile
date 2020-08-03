FROM php:7.4.8-fpm-buster
MAINTAINER "Gilson Gabriel <gilson@codemastersolucoes.com>"

COPY ./docker-php-entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-php-entrypoint

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget gnupg2 ca-certificates lsb-release \
    && echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
        | tee /etc/apt/sources.list.d/nginx.list \
    && curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add - \
    && apt-key fingerprint ABF5BD827BD9BF62 \
    && apt-get update -y && apt-get upgrade -y && apt-get install -y nginx \
    && mkdir /usr/share/nginx/errors \
    && mkdir /moodle && mkdir /var/www/moodledata \
    && chown -R www-data:www-data /var/www/moodledata

COPY ./errors/* /usr/share/nginx/errors/
COPY ./default.conf /etc/nginx/conf.d/

RUN cd /moodle && wget https://github.com/moodle/moodle/archive/v3.9.1.tar.gz \
    && tar -xvzf v3.9.1.tar.gz && cp -rf moodle-3.9.1/* /var/www/html/ \
    && rm -rf /moodle \
    && apt-get remove -y lsb-release wget gnupg2 \
    && apt-get autoremove -y

EXPOSE 9000
EXPOSE 80