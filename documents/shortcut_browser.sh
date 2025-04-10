#!/bin/bash
# Name: Shortcut Browser
# Author: slyhype
# DontUseFBInk

## CONFIG HERE
export GO_FULLSCREEN=true # Set to true if you want to run the browser in fullscreen mode (Kills Amazon UI)
export FULLSCREEN_SITE="file:///mnt/us/fullscreenbrowser/index.html" # Set to the URL you want to open in fullscreen mode
export DISABLESHELL="--content-shell-hide-toolbar" # Set to --content-shell-hide-toolbar if you want to hide the fallback toolbar, blank to show it
## END CONFIG

## Check if we have chromium installed, if not then exit!
if [ ! -f /usr/bin/chromium/bin/kindle_browser ]; then
   ## Just exit, we are not able to run the browser:
   exit
fi

## Thanks KOReader! I'll be borrowing this :)
if [ -d /etc/upstart ]; then
    export INIT_TYPE="upstart"
    if [ -f /etc/upstart/functions ]; then
        . /etc/upstart/functions
    fi
else
    export INIT_TYPE="sysv"
    if [ -f /etc/rc.d/functions ]; then
        . /etc/rc.d/functions
    fi
fi

if [ "${GO_FULLSCREEN}" ]; then
    ## Check if using framework or labgui, then stop ui
    eips -c
    if [ "${INIT_TYPE}" = "sysv" ]; then
        /etc/init.d/framework stop
    else
        trap "" TERM
        stop lab126_gui
        usleep 1250000
        trap - TERM
    fi
fi

## Run the browser
eips -c
XDG_CONFIG_HOME="/mnt/us/system/browser/" LD_LIBRARY_PATH="/usr/bin/chromium/lib:/usr/bin/chromium/usr/lib:/usr/lib/" /usr/bin/chromium/bin/kindle_browser --single-process --no-sandbox --force-device-scale-factor=2 $DISABLESHELL --enable-grayscale-mode --enable-low-res-tiling $FULLSCREEN_SITE 2>/dev/null
eips -c

if [ "${GO_FULLSCREEN}" ]; then
    ## Check if using framework or labgui, then start ui
    if [ "${INIT_TYPE}" = "sysv" ]; then
        cd / && /etc/init.d/framework start
    else
        cd / && start lab126_gui
        usleep 1250000
    fi
fi

eips -c
exit