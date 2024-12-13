#!/bin/bash
while true; do
  /bin/bash /root/mdevs/mdevs_manage.sh >> /root/mdevs/mdevs_logs.txt 2>&1
  sleep 30
done
