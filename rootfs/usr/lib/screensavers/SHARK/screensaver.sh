#!/bin/bash

play() {
  while true; do
    for i in {1..15}; do
      cat "/usr/lib/screensavers/SHARK/aswim${i}.bmp" > /dev/fb0
      sleep 0.15
    done
    CLEAR_SCREEN
    # 3s sleep, less blocking
    sleep 0.5
    sleep 0.5
    sleep 0.5
    sleep 0.5
    sleep 0.5
    sleep 0.5
  done
}


play &
running_pid=$!

button="$(/usr/sbin/screensaver_button_listener)"
logger -t SharkScreensaver "Dismissing Screensaver"
kill -9 "$running_pid"
