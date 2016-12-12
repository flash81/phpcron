#!/bin/bash
touch /cron.log
tail -F /cron.log &

echo "${CRON} >> /cron.log 2>&1" > /crontab.conf
crontab  /crontab.conf
echo "=> Running cron job"
exec cron -f