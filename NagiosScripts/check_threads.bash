#!/bin/bash
RESULT=`ps -eLf | wc -l`
let THREADS=$RESULT
CRITICAL=600
WARNING=500
if [ $THREADS -gt  $CRITICAL ]; then
        echo "CRITICAL: $THREADS threads total!|threads=$THREADS"
        exit 2
elif [ $THREADS -gt $WARNING ]; then
        echo "WARNING: $THREADS total threads.|threads=$THREADS"
        exit 1
else
        echo "OK: $THREADS threads.|threads=$THREADS"
        exit 0
fi
