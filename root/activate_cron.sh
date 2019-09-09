#!/bin/sh

#mode 0755

/etc/init.d/cron start
/etc/init.d/cron enable
logread | grep cron
