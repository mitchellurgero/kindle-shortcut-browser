#!/bin/bash
# Name: Example Shortcut
# Icon: <someIcon>
# Author: slyhype
# DontUseFBInk

## Last modified bits by yeetyeeter456 on Discord
# Modify the "Last-opened" comment to set the current time
# It's done in order to place the scriptlet to the top of recently read booklist
timestamp=$(date +%s)
sed -i "s/^# Last-opened:.*/# Last-opened: $timestamp/" "$0"

/bin/bash /mnt/us/documents/shortcut_browser.sh -u "https://example.com"