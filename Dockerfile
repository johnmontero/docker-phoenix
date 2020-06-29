FROM jmontero/elixir:1.9.2
MAINTAINER John Montero <jmonteroc@gmail.com>
RUN apk --no-cache add -U nodejs nodejs-npm inotify-tools libsass libsass-dev sassc \
    && mix archive.install hex phx_new 1.5.3 --force

ENV QT_QPA_PLATFORM=offscreen

RUN apk add --update-cache \
        xvfb \
        dbus \
        ttf-freefont \
        fontconfig && \
    apk add --update-cache \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted \
        wkhtmltopdf && \
    rm -rf /var/cache/apk/* && \
    chmod +x /usr/bin/wkhtmltopdf