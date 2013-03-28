#!/bin/bash
RESULT=`df -P | grep appname`;
if [ -n "$RESULT" ]; then
        MOUNTP = `df -P | grep appname | awk '{ print $6 }'`;
        echo "APPNAME OK: Mount appears up at $MOUNTP"
        exit 0
else
        echo "APPNAME CRITICAL: /mnt/wfExports appears down"
        exit 2
fi
