FROM hypriot/rpi-alpine:3.6
MAINTAINER Vince Tse <vincetse@users.noreply.github.com>

RUN apk update && \
  apk upgrade && \
  apk add \
    git \
    openssh \
    vim && \
  uname -a
RUN apk add curl
