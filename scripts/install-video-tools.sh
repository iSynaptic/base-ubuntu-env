#!/bin/bash

source ./common.sh

if ! which youtube-dl > /dev/null; then
    installing "YouTube Downloader"

    curl -o /tmp/youtube-dl -sSL https://youtube-dl.org/downloads/latest/youtube-dl
    install /tmp/youtube-dl /usr/local/bin/youtube-dl

    rm /tmp/youtube-dl
fi

if ! which ffmpeg > /dev/null; then
  installing "ffmpeg"

  apt-get install -y ffmpeg
fi