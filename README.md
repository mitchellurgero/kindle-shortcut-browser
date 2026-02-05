## Shortcut Browser

Scriptlet that can turn your kindle into a kiosk or setup a shortcut to open a website of any choice!

**For Kindle Firmwares 5.16.4+ ONLY**

[Git Repo](https://github.com/mitchellurgero/kindle-shortcut-browser)

## Using:

1. Download the [Latest Zip](https://github.com/mitchellurgero/kindle-shortcut-browser/releases)
2. Extract the contents to the root of your kindle
3. Modify `https://example.com` in `<YourKindle>\documents\shortcutbrowser\index.html` OR change the `FULLSCREEN_SITE` variable in `<YourKindle\documents\shortcut_browser.sh` to your site of choice.
4. Run the app!

**NOW WITH KEYBOARD SUPPORT** *Only tested on Kindle 10th Gen (KT4) on 5.18.1 Firmware.*

You can also change the `GO_FULLSCREEN` to `false` to keep the UI in the background. 

A new script, `shortcut_stop.sh` is included in case the browser processes get out of control.

You can name the script whatever you want as well if you want multiple copies of it on the home screen.

## Know Issues:

- If the browser does funky shit, just hit the `Stop Shortcut Browser` scriptlet in your library or restart the device.
- Since this is using an iframe some websites will NOT load if using the included index.html file - simply change `FULLSCREEN_SITE` to your preferred site.
