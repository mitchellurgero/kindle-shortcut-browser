#!/bin/bash
# Name: Stop Shortcut Browser
# Author: slyhype
# DontUseFBInk

refresh_screen(){
    eips -c &> /dev/null
    eips -c &> /dev/null
}
refresh_screen
killall kindle_browser

echo "Starting gui"
## Check if using framework or labgui, then start ui
if [ "${INIT_TYPE}" = "sysv" ]; then
    cd / && /etc/init.d/framework start
else
    cd / && start lab126_gui
    usleep 1250000
fi
refresh_screen
eips 1 1 "Please wait while UI is reset"
refresh_screen
exit