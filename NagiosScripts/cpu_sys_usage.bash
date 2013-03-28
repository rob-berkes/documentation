#!/bin/bash
WARNING=30
CRITICAL=55
cat /proc/stat > /tmp/proc.stat
CPUUSER=`cat /tmp/proc.stat | grep 'cpu ' | awk '{print $2}'`
CPUNICE=`cat /tmp/proc.stat | grep 'cpu ' | awk '{print $3}'`
CPUSYS=`cat /tmp/proc.stat | grep 'cpu ' | awk '{print $4}'`
CPUIDLE=`cat /tmp/proc.stat | grep 'cpu ' | awk '{print $5}'`
sleep 3s;
cat /proc/stat > /tmp/proc.stat2
NEXTUSER=`cat /tmp/proc.stat2 | grep 'cpu ' | awk '{print $2}'`
NEXTNICE=`cat /tmp/proc.stat2 | grep 'cpu ' | awk '{print $3}'`
NEXTSYS=`cat /tmp/proc.stat2 | grep 'cpu ' | awk '{print $4}'`
NEXTIDLE=`cat /tmp/proc.stat2 | grep 'cpu ' | awk '{print $5}'`
CPUTOTAL=0
let CPUTOTAL+=$CPUUSER;
let CPUTOTAL+=$CPUNICE;
let CPUTOTAL+=$CPUSYS;
let CPUTOTAL+=$CPUIDLE;
NEXTTOTAL=0
let NEXTTOTAL+=$NEXTUSER;
let NEXTTOTAL+=$NEXTNICE;
let NEXTTOTAL+=$NEXTSYS;
let NEXTTOTAL+=$NEXTIDLE;

let "DIFFUSER=$NEXTUSER-$CPUUSER";
let "DIFFNICE=$NEXTNICE-$CPUNICE";
let "DIFFSYS=$NEXTSYS-$CPUSYS";
let "DIFFIDLE=$NEXTIDLE-$CPUIDLE";
let "DIFFTOTAL=$NEXTTOTAL-$CPUTOTAL";

let "DIFFSYSTOT=(1000*($DIFFSYS)/$DIFFTOTAL)/10";

if [ $DIFFSYSTOT -gt $CRITICAL ]; then
        echo "CRITICAL: CPU use by system user at $DIFFSYSTOT";
        exit 2
elif [ $DIFFSYSTOT -gt $WARNING ]; then
        echo "WARNING: CPU use by system user at $DIFFSYSTOT";
        exit 1
else
        echo "OK: CPU use by system user at $DIFFSYSTOT";
fi
