#!/bin/sh
cd /mnt/host
app_source=$(find /mnt/host -name "*.zip" -print -quit)
unzip -qo $app_source -d /opt/foundryvtt/

cd /opt/foundryvtt
node resources/app/main.js --dataPath=/mnt/data --port=30000 --hostname=0.0.0.0
