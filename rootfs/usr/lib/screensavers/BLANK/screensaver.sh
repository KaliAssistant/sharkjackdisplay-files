#!/bin/bash
echo -en "\033[?5l" > /dev/tty0
CLEAR_SCREEN
resp="$(/usr/sbin/screensaver_button_listener)"
logger -t SharkScreensaver "Dismissing Screensaver"
