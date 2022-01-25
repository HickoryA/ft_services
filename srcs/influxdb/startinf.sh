#!/bin/sh
/usr/bin/supervisord -c /etc/supervisord.conf
#influxd -config /etc/influxdb.conf & /telegraf/usr/bin/telegraf