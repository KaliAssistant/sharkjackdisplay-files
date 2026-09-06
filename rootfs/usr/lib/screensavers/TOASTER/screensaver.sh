#!/bin/bash

play() {
  while true; do
    cat /dev/zero > /dev/fb0
    for i in {1..26}; do
      cat "/usr/lib/screensavers/TOASTER/a${i}.bmp" > /dev/fb0
      sleep 0.04
    done
    CLEAR_SCREEN
    sleep 0.5
    sleep 0.5
  done
}


play &
running_pid=$!

button="$(/usr/sbin/screensaver_button_listener)"
logger -t SharkScreensaver "Dismissing Screensaver"
kill -9 $running_pid
