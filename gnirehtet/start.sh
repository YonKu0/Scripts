#!/bin/bash
adb devices
gnirehtet run 2>&1 | tee gnirehtetlog.txt
