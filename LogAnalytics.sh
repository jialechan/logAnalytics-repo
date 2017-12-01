#!/bin/bash

source /etc/profile

cd /userdata1/server_script/logAnalytics-repo

git pull

/userdata1/software/jdk1.8/bin/java -jar ./LogAnalytics.jar --dateStr=`date -d yesterday +%Y-%m-%d`
