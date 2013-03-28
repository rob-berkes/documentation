#!/bin/bash
DIRECTORY=/usr/local/jboss/server/acmecoonline/log/ 
RESULT=`find /usr/local/jboss/server/acmecoonline/log/ -type f | wc -l`
WARNING=15
CRITICAL=30

if [ -n $RESULT ]; then
if [ $RESULT -gt $CRITICAL ]; then 
echo "DIRECTORY CRITICAL; $RESULT files in /usr/local/jboss/server/acmecoonline/log/";
exit 2
elif [ $RESULT -gt $WARNING ]; then
echo "DIRECTORY WARNING; $RESULT files in /usr/local/jboss/server/acmecoonline/log/";
exit 1
fi

echo "DIRECTORY OK: $RESULT files in $DIRECTORY";
exit 0
else
echo "DIRECTORY NOT OK!: Cannot count files, general error, schmuck!"
exit 2
fi
