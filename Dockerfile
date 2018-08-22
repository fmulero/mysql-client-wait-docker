FROM alpine:3.6

ENV DB_HOST localhost
ENV DB_PORT 3306
ENV DB_USER root
ENV DB_PASSWORD ''
ENV DB_NAME mysql

RUN mkdir -p /opt/mysql-client \
  && apk add mysql-client --update \
  && rm -rf /var/cache/apk/*

COPY wait-for-it.sh /opt/mysql-client/
COPY entrypoint.sh /opt/mysql-client/entrypoint

# Default location for sql migrations
VOLUME /sql

ENTRYPOINT ["/opt/mysql-client/entrypoint"]
#CMD ["/bin/sh"]