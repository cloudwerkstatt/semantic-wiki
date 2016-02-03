FROM registry.access.redhat.com/rhel7.2:latest

MAINTAINER Michael Eimke michael.eimke@airbus.com

ENV https_proxy debre-proxy:8080

ENV MEDIA_WIKI_VERSION 1.26
ENV MEDIA_WIKI_MINOR 2

RUN yum -y update \
    && yum install -y tar httpd php php-mysql php-xml php-gd ImageMagick \
    && yum clean all \
    && cd /tmp \
    && curl -LO https://releases.wikimedia.org/mediawiki/${MEDIA_WIKI_VERSION}/mediawiki-${MEDIA_WIKI_VERSION}.${MEDIA_WIKI_MINOR}.tar.gz \
    && tar xzvf mediawiki-${MEDIA_WIKI_VERSION}.${MEDIA_WIKI_MINOR}.tar.gz \
    && rm -f mediawiki-${MEDIA_WIKI_VERSION}.${MEDIA_WIKI_MINOR}.tar.gz \
    && mv mediawiki-${MEDIA_WIKI_VERSION}.${MEDIA_WIKI_MINOR}/* /var/www/html/ \
    && chmod -R 777 /var/www/

ADD container-files /

ENV MEDIAWIKI_SITE_NAME semantic-wiki
ENV MEDIAWIKI_DB_HOST mysql
ENV MEDIAWIKI_DB_USER defaultuser
ENV MEDIAWIKI_DB_PASSWORD defaultpassword
ENV MEDIAWIKI_DB_NAME mediawiki
ENV MEDIAWIKI_ADMIN_PASSWORD adminuser
ENV MEDIAWIKI_ADMIN_USER adminpassword

EXPOSE 8080

CMD /docker-entrypoint.sh
