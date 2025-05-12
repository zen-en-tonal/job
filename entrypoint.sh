#!/bin/bash

# verify env
if [ -z "$CRON_COMMAND" ]; then
  echo "CRON_COMMAND is not set"
  exit 1
fi

if [ -z "$CRON_SCHEDULE" ]; then
  echo "CRON_SCHEDULE is not set"
  exit 1
fi

echo "$CRON_SCHEDULE root $CRON_COMMAND >> /var/log/cron.log 2>&1" > /etc/cron.d/myjob

chmod 0644 /etc/cron.d/myjob
crontab /etc/cron.d/myjob

echo "Cron schedule: $CRON_SCHEDULE"
echo "Command: $CRON_COMMAND"

cron -f
