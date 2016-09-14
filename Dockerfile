FROM alvarolizama/elixir
MAINTAINER Alvaro Lizama Molina <hola@alvarolizama.net>
RUN apk --no-cache add -U nodejs inotify-tools \
    && mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

