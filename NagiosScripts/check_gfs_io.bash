#!/bin/bash
RESULT=`(dd if=/dev/zero of=/mnt/gfs/$HOSTNAME.tmp bs=8192k count=3) 2>&1 | awk '/bytes/ {print int($8)}'`
let IOSPEED=$RESULT
WARN_THRESHOLD=10
CRIT_THRESHOLD=3
if [ $IOSPEED -lt $WARN_THRESHOLD ]; then
        echo "DD Warning! Writing to GFS is slow $IOSPEED MB/s";
        exit 1
elif [ $IOSPEED -lt $CRIT_THRESHOLD ]; then
        echo "DD Critical! GFS very slow $IOSPEED MB/s";
        exit 2
else
        echo "OK! IO to GFS $IOSPEED MB/s|gfsio={$IOSPEED}MB;$WARN_THRESHOLD;$CRIT_THRESHOLD;;";
        exit 0
fi
