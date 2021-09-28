FROM hypriot/rpi-alpine:3.6
MAINTAINER Vince Tse <vincetse@users.noreply.github.com>

RUN apk update && \
  apk upgrade && \
  apk add \
    git \
    openssh \
    vim \
    curl && \
    uname -a

RUN \
  apk add --no-cache \
    faenza-icon-theme \
    faenza-icon-theme-xfce4-appfinder \
    faenza-icon-theme-xfce4-panel \
    xfce4 \
    terminator && \
  apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    xfce4-pulseaudio-plugin && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*
    
COPY /root /
VOLUME /home
RUN apk add xrdp
