FROM nginx:1.11.10-alpine

ENV HTPASSWD='foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.' \
    FORWARD_PORT=80 \
    FORWARD_HOST=web

RUN apk update && apk upgrade && \
    apk add --no-cache gettext && \
    apk add bash curl nmap ca-certificates logrotate tzdata && \
    cp /usr/share/zoneinfo/America/New_York /etc/localtime && \
    rm -rf /var/cache/apk/* /tmp/*

WORKDIR /opt

COPY auth.conf auth.htpasswd launch.sh ./

CMD ["./launch.sh"]

