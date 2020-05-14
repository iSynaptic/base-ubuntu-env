#!/bin/bash

source ./common.sh

if ! which youtube-dl > /dev/null; then
    installing "YouTube Downloader"

    curl -o /tmp/youtube-dl -sSL https://github.com/ytdl-org/youtube-dl/releases/download/2020.05.08/youtube-dl
    install /tmp/youtube-dl /usr/local/bin/youtube-dl

    rm /tmp/youtube-dl
fi

if ! which ffmpeg > /dev/null; then
  installing "ffmpeg"

  apt-get install -y ffmpeg
fi