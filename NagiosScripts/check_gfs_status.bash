#!/bin/bash
RESULT=`/sbin/group_tool | awk '$1~/gfs/ {print $5}'`

if [ $RESULT = 'none' ]; then
        echo "GFS OK! Status is $RESULT";
        exit 0
else
        echo "GFS ERROR!  Status is $RESULT";
        exit 2
fi
