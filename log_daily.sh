#!/bin/bash

source $(cd `dirname $0`; pwd)/nginxConfig.sh

for log in `ls $LOG_PATH`; do
    echo $log | grep '.log$' > /dev/null
    if [ $? -eq 0 ];then
        NEW_LOG_FILE_PATH=$LOG_PATH/${log}_`date -d yesterday +%Y-%m-%d`
        mv $LOG_PATH/$log $NEW_LOG_FILE_PATH
        chmod 666 $NEW_LOG_FILE_PATH
    fi
done

# ask nginx to generate new log file
kill -USR1 `cat $PID_PATH`

find $LOG_PATH -type f -mtime +3 -name "*access.log*" -exec rm {} \;