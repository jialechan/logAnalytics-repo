#!/bin/bash

source /etc/profile

cd /userdata1/server_script/

git pull https://github.com/jialechan/logAnalytics-repo

chmod +x ./jq
chmod +x ./LogAnalytics.jar

/userdata1/software/jdk1.8/bin/java -jar ./LogAnalytics.jar --dateStr=`date -d yesterday +%Y-%m-%d`